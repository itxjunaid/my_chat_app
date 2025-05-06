
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';
import '../models/user.dart';

class EditBioScreen extends StatefulWidget {
  static const routeName = '/edit-bio';

  @override
  _EditBioScreenState createState() => _EditBioScreenState();
}

class _EditBioScreenState extends State<EditBioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bioController = TextEditingController();

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    _bioController.text = user.bio;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Bio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                label: 'Bio',
                hint: 'Enter your new bio',
                controller: _bioController,
                
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                label: 'Save',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    user.bio = _bioController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Bio updated successfully!'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}