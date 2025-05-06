class Chat {
  final String id;
  final List<String> userIds;
  final String lastMessage;
  final DateTime lastMessageTime;

  Chat({
    required this.id,
    required this.userIds,
    required this.lastMessage,
    required this.lastMessageTime,
  });
}