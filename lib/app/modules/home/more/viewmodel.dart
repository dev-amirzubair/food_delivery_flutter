import 'package:flutter/material.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:food_delivery/app/utils/utils.dart';

class MoreViewModal extends ChangeNotifier {
  Future<void> logout(BuildContext context) async {
    Utils.logout();
    Navigator.pushNamedAndRemoveUntil(
        context, RouteName.login, (Route<dynamic> route) => false);
  }

  Future<void> profilePress(BuildContext context) async {
    Navigator.pushNamed(context, RouteName.profile);
  }
}
