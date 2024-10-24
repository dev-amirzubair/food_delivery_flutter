import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/custom_input.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/login/signin/model.dart';
import 'package:food_delivery/app/modules/login/signin/viewmodel.dart';
import 'package:provider/provider.dart';

class LoginTab extends StatefulWidget {
  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  bool isRememberMe = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomInput(
                title: tr('phone'),
                hintText: tr('yourId'),
                inputType: TextInputType.phone,
                controller: phoneController,
                onChanged: (value) {
                  // update value
                  print(value);
                },
                validatorFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Please enter valid phone (Numbers only)';
                  } else if (value.length < 11) {
                    return 'Please enter complete number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomInput(
                title: tr('password'),
                hintText: tr('yourPassword'),
                inputType: TextInputType.text,
                isPassword: true,
                controller: passwordController,
                onChanged: (value) {
                  // update value
                  print(value);
                },
                validatorFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                    // } else if (value.length < 8) {
                    //   return 'Password must be at least 8 characters';
                    // } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                    //   return 'Password must contain a number';
                    // } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                    //   return 'Password must contain a special character';
                  }
                  return null;
                },
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isRememberMe,
                        onChanged: (value) {
                          // Set check box logic
                          setState(() {
                            isRememberMe = value!;
                          });
                        },
                      ),
                      Text(
                        tr('rememberMe'),
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      tr('forgotPassword'),
                      style: TextStyle(fontSize: 10, color: AppColors.blue),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Consumer<SignInViewModel>(
                builder: (context, viewModal, child) {
                  return viewModal.isLoading
                      ? CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Provider.of<SignInViewModel>(context,
                                          listen: false)
                                      .loginUser(
                                    context,
                                    SignInModel(
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                      remberMe: isRememberMe,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                elevation: 5,
                              ),
                              child: Text(
                                tr('login'),
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 14),
                              )),
                        );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      child: Container(
                        height: 1,
                        color: AppColors.black,
                        margin: EdgeInsets.only(right: 15, left: 15),
                      )),
                  Text(tr('or')),
                  SizedBox(
                      width: 100,
                      child: Container(
                        height: 1,
                        color: AppColors.black,
                        margin: EdgeInsets.only(left: 15, right: 15),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF3F3F3),
                        elevation: 1,
                      ),
                      child: Row(
                        children: [
                          Text(' ${tr("continueWith")} '),
                          Image.asset(
                            'assets/imgs/google.png',
                            height: 17,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
