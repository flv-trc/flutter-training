import 'inbox_packages.dart';

final dashboardInboxViewModelProvider =
    StateNotifierProvider<DasbhoardInboxViewModel, List<InboxMessage>>(
      (ref) => DasbhoardInboxViewModel().._loadMessages(),
    );

class DasbhoardInboxViewModel extends StateNotifier<List<InboxMessage>> {
  DasbhoardInboxViewModel() : super([]);

  void _loadMessages() {
    final random = Random();

    state = List.generate(
      20,
      (index) => InboxMessage(
        imageUrl: Images.workouts[index % Images.workouts.length],
        title: _sampleTitles[random.nextInt(_sampleTitles.length)],
        body: _sampleBodies[random.nextInt(_sampleBodies.length)],
        timestamp: _sampleTimestamps[random.nextInt(_sampleTimestamps.length)],
      ),
    );
  }

  Future<void> refreshMessages() async {
    await Future.delayed(const Duration(seconds: 1));
    _loadMessages();
  }
}

// Sample data for dev/testing
const List<String> _sampleTitles = [
  'New Workout Tips',
  'Daily Mindfulness',
  'Hydration Reminder',
  'Evening Stretch Routine',
  'Nutrition Insights',
  'Sleep Optimization',
  'Training Plan Update',
  'Motivational Boost',
];

const List<String> _sampleBodies = [
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  'Excepteur sint occaecat cupidatat non proident.',
  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
  'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
  'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?',
  'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur?',
  'Vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
];

const List<String> _sampleTimestamps = [
  'Just now',
  '5 min ago',
  '1 hour ago',
  'Today',
  'Yesterday',
  '2 days ago',
  'Last week',
  '1 week ago',
];
