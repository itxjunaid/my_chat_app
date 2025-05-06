import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../widgets/profile_image.dart';
import '../widgets/custom_elevated_button.dart';
import '../models/user.dart';

class EditProfilePictureScreen extends StatefulWidget {
  static const routeName = '/edit-profile-picture';

  const EditProfilePictureScreen({super.key});

  @override
  EditProfilePictureScreenState createState() =>
      EditProfilePictureScreenState();
}

class EditProfilePictureScreenState extends State<EditProfilePictureScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveProfilePicture(BuildContext context) {
    // Here you should save the image to the backend or local storage
    // For now we just print a message
    if (_image != null) {
      print('Image saved: ${_image!.path}');
    } else {
      print('No image selected');
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfileImage(
              imagePath: _image?.path ?? user.profilePictureUrl,
              radius: 80,
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
                label: 'Select new image',
                onPressed: () {
                  _pickImage();
                }),
            const SizedBox(height: 20),
            CustomElevatedButton(
              label: 'Save',
              onPressed: () => _saveProfilePicture(context),
            ),
          ],
        ),
      ),
    );
  }
}