import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModal extends ChangeNotifier {
  File? _image;
  File? get image => _image;

  Future<void> goBack(BuildContext context) async {
    Navigator.pop(context);
  }

  Future getImage() async {
    final imagePath =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePath == null) return;
    _image = File(imagePath.path);
    notifyListeners();
    return imagePath;
  }

  Future addLocation(BuildContext context) async {
    Navigator.pushNamed(context, RouteName.map);
  }
}
