import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/custom_input.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:food_delivery/app/modules/login/signup/viewmodel.dart';
import 'package:provider/provider.dart';

class SignUpTab extends StatefulWidget {
  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
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
                title: tr("name"),
                hintText: tr("yourName"),
                inputType: TextInputType.text,
                controller: nameController,
                onChanged: (value) {
                  // update value
                  print(value);
                },
                validatorFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  } else if (value.length < 3) {
                    return 'Please enter complete name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomInput(
                title: tr("phone"),
                hintText: tr("yourPhone"),
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
                    return 'Please enter valid phone (numbers only)';
                  } else if (value.length < 11) {
                    return 'Please enter complete number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomInput(
                title: tr("password"),
                hintText: tr("yourPassword"),
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
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain a number';
                  } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                    return 'Password must contain a special character';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Consumer<SignUpViewModel>(
                builder: (context, viewModal, child) {
                  return viewModal.isLoading
                      ? Text('Loading...')
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, RouteName.home);
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
                                tr('signUp'),
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
                        backgroundColor: AppColors.whiteLight,
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
