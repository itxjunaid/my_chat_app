import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Placeholder image
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Icon(Icons.edit,
                        size: 20,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'John Doe', // Placeholder name
              style: GoogleFonts.roboto(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              'johndoe@example.com', // Placeholder email
              style: GoogleFonts.roboto(fontSize: 16),
            ),
          ),
          Center(
            child: Text(
              '+1 123-456-7890', // Placeholder phone
              style: GoogleFonts.roboto(fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          // Edit Options
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Name'),
            onTap: () {
              // Navigate to Edit Name screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Edit Bio'),
            onTap: () {
              // Navigate to Edit Bio screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Edit Profile Picture'),
            onTap: () {
              // Navigate to Edit Profile Picture screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {
              // Navigate to Change Password screen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
            onTap: () {
              // Implement sign out logic
            },
          ),
        ],
      ),
    );
  }
}