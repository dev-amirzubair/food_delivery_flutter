import 'package:flutter/material.dart';
import 'package:food_delivery/app/routes/routes.dart';

class HomeViewModel extends ChangeNotifier {
  Future<void> showProductDetails(BuildContext context, String id) async {
    Navigator.pushNamed(context, RouteName.productInfo, arguments: {"id": id});
  }
}
