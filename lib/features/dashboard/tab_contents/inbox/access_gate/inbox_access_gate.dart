import '../inbox_packages.dart';
import 'inbox_access_viewmodel.dart';
import 'inbox_permission_page.dart';

class InboxAccessGate extends ConsumerStatefulWidget {
  final Widget child;

  const InboxAccessGate({super.key, required this.child});

  @override
  ConsumerState<InboxAccessGate> createState() => _InboxAccessGateState();
}

class _InboxAccessGateState extends ConsumerState<InboxAccessGate> {
  bool _hasPresented = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(_checkAndShowPermissionRequestIfNeeded);
  }

  Future<void> _checkAndShowPermissionRequestIfNeeded() async {
    final accessVM = ref.read(inboxAccessViewModelProvider.notifier);
    await accessVM.checkAndTrackAccess();
    final shouldShowInbox = ref.read(inboxAccessViewModelProvider);

    if (!shouldShowInbox && !_hasPresented && mounted) {
      _hasPresented = true;

      void handleDismiss() {
        Navigator.of(context).pop();
        accessVM.closePermissionScreen();
      }

      await showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, anim, _) {
          return InboxPermissionScreen(
            onAllow: handleDismiss,
            onDeny: handleDismiss,
            onClose: handleDismiss,
          );
        },
        transitionBuilder: (context, anim, _, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(
                  CurvedAnimation(parent: anim, curve: Curves.easeOutCubic),
                ),
            child: child,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
