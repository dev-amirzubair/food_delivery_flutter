import 'package:flutter/material.dart';

class MapViewModal extends ChangeNotifier {
  Future<void> goBack(BuildContext context) async {
    Navigator.pop(context);
  }
}
