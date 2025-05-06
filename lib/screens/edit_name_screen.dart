import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';
import '../models/user.dart';

class EditNameScreen extends StatefulWidget {
  static const routeName = '/edit-name';

  const EditNameScreen({Key? key}) : super(key: key);

  @override
  _EditNameScreenState createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditNameScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = Provider.of<User>(context);
    _nameController.text = user.name;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically update the user's name in your data store
      // For now, we'll just print the new name and pop the screen
      print('New name: ${_nameController.text}');
      // Update the user name
      final user = Provider.of<User>(context, listen: false);
      user.name = _nameController.text;
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                label: 'Name',
                hint: 'Enter your new name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                label: 'Save',
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}