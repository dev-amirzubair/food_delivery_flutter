class SignInModel {
  final String phone;
  final String password;
  final bool remberMe;

  SignInModel(
      {required this.phone, required this.password, required this.remberMe});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      phone: json['id'],
      password: json['password'],
      remberMe: json['remberMe'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': phone,
      'password': password,
      'remberMe': remberMe,
    };
  }
}

class LoginResponseModel {
  final String token;
  final String userId;
  final String userName;

  LoginResponseModel({
    required this.token,
    required this.userId,
    required this.userName,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      userId: json['userId'],
      userName: json['userName'],
    );
  }
}
