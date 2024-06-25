import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pet_pals/screens/home/home.dart';

class AddAvatarPage extends StatefulWidget {
  const AddAvatarPage({super.key});

  @override
  _AddAvatarPageState createState() => _AddAvatarPageState();
}

class _AddAvatarPageState extends State<AddAvatarPage> {
  File? _avatarImage;

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _avatarImage = File(image.path);
        });
        print('Image selected: ${image.path}');
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5641EF),
      appBar: AppBar(
        backgroundColor: Color(0xFF5641EF),
        title: Text(
          'Add Avatar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _avatarImage != null
                ? CircleAvatar(
              radius: 80,
              backgroundImage: FileImage(_avatarImage!),
            )
                : CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF5641EF), backgroundColor: Colors.white,
              ),
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_avatarImage != null) {
                  // 在此处处理提交头像的逻辑
                  Get.to(() => HomePage());
                  print('头像图片路径: ${_avatarImage!.path}');
                } else {
                  print('No image selected to submit.');
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF5641EF), backgroundColor: Colors.white,
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
