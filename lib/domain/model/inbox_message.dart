class InboxMessage {
  final String id;
  final String imageUrl;
  final String title;
  final String body;
  final String timestamp;

  InboxMessage({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  factory InboxMessage.fromJson(Map<String, dynamic> json) => InboxMessage(
    id: json['id'],
    title: json['title'],
    body: json['body'],
    timestamp: json['timestamp'],
    imageUrl: json['imageUrl'],
  );
}
