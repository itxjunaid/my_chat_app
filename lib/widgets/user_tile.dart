import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String? profileImageUrl;

  const UserTile({
    Key? key,
    required this.name,
    this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: profileImageUrl != null ? NetworkImage(profileImageUrl!) : null,
        child: profileImageUrl == null ? const Icon(Icons.person) : null,
      ),
      title: Text(name),
    );
  }
}