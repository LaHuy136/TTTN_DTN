// ignore_for_file: sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../themes/colors.dart';

class MyAvatar extends StatefulWidget {
  const MyAvatar({super.key});

  @override
  State<MyAvatar> createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null ? const Icon(Icons.person, size: 80) : null,
          ),
          const SizedBox(height: 10),
          IconButton(
            onPressed: _pickImage,
            icon: Container(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.photo_camera_outlined),
                  const SizedBox(width: 4),
                  Text(
                    'Tải ảnh lên',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
