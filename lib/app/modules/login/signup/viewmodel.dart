import 'package:flutter/material.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:food_delivery/app/modules/login/signup/model.dart';
import 'package:food_delivery/app/services/network_services.dart';
import 'package:food_delivery/app/services/network_url.dart';
import 'package:food_delivery/app/utils/tostify.dart';
import 'package:food_delivery/app/utils/utils.dart';

class SignUpViewModel extends ChangeNotifier {
  String name = '';
  String username = '';
  String password = '';
  bool _isLoading = false;
  bool _success = false;

  bool get isLoading => _isLoading;
  bool get canSignUp =>
      name.isNotEmpty && username.isNotEmpty && password.isNotEmpty;

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void signUp() async {
    if (canSignUp) {
      // Make Login Request
      print("Sign Up Successfully!");
    }
  }

  Future<void> signupUser(BuildContext context, SignUpModel signUpModel) async {
    _isLoading = true;
    _success = false;
    notifyListeners();

    try {
      // Use the NetworkHelper to make the request
      NetworkHelper networkHelper = NetworkHelper(url: URLS.REGISTER);
      var response = await networkHelper.postData(signUpModel.toJson());

      _isLoading = false;
      notifyListeners();

      if (response != null) {
        // Convert response to the SignUpResponseModel
        SignUpResponseModel signUpResponse =
            SignUpResponseModel.fromJson(response);

        // Success handling
        print("Signup successful, Token: ${signUpResponse.success}");
        CustomToast("Resister successfully!");

        _success = true;
        notifyListeners();

        // Navigate to HomePage after successful signup
        Navigator.pushReplacementNamed(
          context,
          RouteName.home,
        );

        // Save login state and token
        Utils.saveLoginState(true, signUpResponse.token);
      } else {
        CustomToast("Error: ${response.message}");
        print("Signup failed");
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
