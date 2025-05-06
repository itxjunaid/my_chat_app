import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _allUsers = [
    'User 1',
    'User 2',
    'User 3',
    'User 4',
    'User 5',
    'Another User',
    'New User',
    'Example User'
  ];
  List<String> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredUsers = List.from(_allUsers);
  }

  void _filterUsers(String query) {
    List<String> filteredList = [];
    if (query.isNotEmpty) {
      filteredList = _allUsers
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredList = List.from(_allUsers);
    }
    setState(() {
      _filteredUsers = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterUsers,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search for users',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(_filteredUsers[index]),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Implement adding user logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Added ${_filteredUsers[index]} to contacts')),
                      );
                    },
                    child: const Text('Add'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}