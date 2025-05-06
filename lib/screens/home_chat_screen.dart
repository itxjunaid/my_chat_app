import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeChatScreen extends StatelessWidget {
  const HomeChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150',
              ),
            ),
            title: Text(
              'User $index',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Last message from User $index',
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            trailing: Text(
              '10:${index < 10 ? '0$index' : index} AM',
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/individualChat');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addContact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}