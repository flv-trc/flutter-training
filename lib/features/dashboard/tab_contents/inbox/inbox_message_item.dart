import 'inbox_packages.dart';
import '../../../../routing/exports.dart';

class InboxMessageItem extends StatelessWidget {
  final InboxMessage message;

  const InboxMessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final image = ClipRect(
      child: Image.asset(
        message.imageUrl,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );

    final textVStack = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Text(message.title, style: Theme.of(context).textTheme.titleMedium),
          Text(
            message.body,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
          ),
          Text(
            message.timestamp,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[500]),
          ),
        ],
      ),
    );

    return InkWell(
      onTap: () {
        Get.toNamed(AppRouter.googleWebView);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [image, textVStack],
        ),
      ),
    );
  }
}
