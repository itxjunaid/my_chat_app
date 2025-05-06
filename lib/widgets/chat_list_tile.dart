import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/widgets/user_tile.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final DateTime timestamp;
  final String profileImageUrl;

  const ChatTile({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.timestamp,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar(imageUrl: profileImageUrl),
      title: Text(
        name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Text(
        DateFormat('HH:mm').format(timestamp),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}