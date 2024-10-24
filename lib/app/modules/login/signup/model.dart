class SignUpModel {
  String name;
  String phone;
  String password;

  SignUpModel(
      {required this.name, required this.phone, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
    };
  }
}

class SignUpResponseModel {
  final bool success;
  final String message;
  final String token;

  SignUpResponseModel({
    required this.success,
    required this.message,
    required this.token,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      success: json['success'],
      token: json['token'],
      message: json['message'],
    );
  }
}
