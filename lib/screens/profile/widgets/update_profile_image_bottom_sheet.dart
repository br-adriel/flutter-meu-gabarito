import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/utils/files.dart';
import 'package:provider/provider.dart';

class UpdateProfileImageBottomSheet extends StatefulWidget {
  const UpdateProfileImageBottomSheet({super.key});

  @override
  State<UpdateProfileImageBottomSheet> createState() =>
      _UpdateProfileImageBottomSheetState();
}

class _UpdateProfileImageBottomSheetState
    extends State<UpdateProfileImageBottomSheet> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<MainStore>(context).auth;

    Future<void> upload() async {
      if (_image != null) {
        String newImageUrl = await uploadProfileImage(_image!, auth.user!.uid);
        auth.updatePhoto(newImageUrl);
      }
    }

    Future imgFromGallery() async {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        upload();
      }
    }

    Future imgFromCamera() async {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        upload();
      }
    }

    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.camera_alt_rounded),
          onTap: () {
            imgFromCamera();
            Navigator.of(context).pop();
          },
          title: const Text("Câmera"),
        ),
        ListTile(
          leading: const Icon(Icons.photo_library_rounded),
          onTap: () {
            imgFromGallery();
            Navigator.of(context).pop();
          },
          title: const Text("Galeria"),
        )
      ],
    );
  }
}
