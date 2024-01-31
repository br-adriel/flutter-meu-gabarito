import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadImage(String uploadPath, File imageFile) async {
  final storageRef = FirebaseStorage.instance.ref();
  final imageRef = storageRef.child(uploadPath);
  await imageRef.putFile(imageFile);

  String downloadUrl = await imageRef.getDownloadURL();
  return downloadUrl;
}

Future<void> deleteFileIfExists(String path) async {
  try {
    final storageRef = FirebaseStorage.instance.ref();
    final fileRef = storageRef.child(path);
    await fileRef.delete();
  } catch (error) {
    //
  }
}

Future<String> uploadProfileImage(File imageFile, String userUid) async {
  String imagePath = imageFile.path;
  String extension = imagePath.substring(imagePath.lastIndexOf('.'));
  String imageName = 'profiles/$userUid/image$extension';

  await deleteFileIfExists(imageName);
  String url = await uploadImage(imageName, imageFile);
  return url;
}
