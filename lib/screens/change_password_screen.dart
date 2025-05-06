import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_elevated_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = '/change-password';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  void _savePassword() {
    if (_formKey.currentState!.validate()) {
      // Here you would handle the logic to change the password
      // This is just a UI example, so we'll just print the values
      print('Old Password: ${_oldPasswordController.text}');
      print('New Password: ${_newPasswordController.text}');
      print('Confirm New Password: ${_confirmNewPasswordController.text}');

      // Optionally, navigate back or show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated!')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _oldPasswordController,
                label: 'Old Password',
                hint: 'Enter your old password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your old password';
                  }
                   if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  // Add more validation as needed
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _newPasswordController,
                label: 'New Password',
                hint: 'Enter your new password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new password';
                  }
                   if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  // Add more validation as needed
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _confirmNewPasswordController,
                label: 'Confirm New Password',
                hint: 'Confirm your new password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                label: 'Save',
                onPressed: _savePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}