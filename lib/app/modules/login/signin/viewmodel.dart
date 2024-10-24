import 'package:flutter/material.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:food_delivery/app/modules/login/signin/model.dart';
import 'package:food_delivery/app/services/network_services.dart';
import 'package:food_delivery/app/services/network_url.dart';
import 'package:food_delivery/app/utils/tostify.dart';
import 'package:food_delivery/app/utils/utils.dart';

class SignInViewModel extends ChangeNotifier {
  String phone = '';
  String password = '';
  bool _isLoading = false;
  bool _success = false;

  bool get isLoading => _isLoading;
  bool get isSuccess => _success;

  void setPhone(String value) {
    phone = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> loginUser(BuildContext context, SignInModel signInModal) async {
    _isLoading = true;
    _success = false;
    notifyListeners();

    try {
      // Use the NetworkHelper to make the request
      NetworkHelper networkHelper = NetworkHelper(url: URLS.LOGIN);
      var response = await networkHelper.postData(signInModal.toJson());

      _isLoading = false;
      notifyListeners();

      print(response);
      if (response != null) {
        // Convert response to the LoginResponseModel
        LoginResponseModel loginResponse =
            LoginResponseModel.fromJson(response);

        // Success handling
        print("Login successful, Token: ${loginResponse.token}");
        CustomToast("Login successfully");
        _success = true;
        notifyListeners();

        // Navigate to HomePage after successful login
        Navigator.pushReplacementNamed(
          context,
          RouteName.home,
        );

        // Save login state in the utility function
        Utils.saveLoginState(true, loginResponse.token);
      } else {
        CustomToast("Error: ${response.message}");
        print("Login failed");
        _success = false;
        notifyListeners();
      }
    } catch (e) {
      print('Error: $e');
      _isLoading = false;
      _success = false;
      notifyListeners();
    }
  }
}
