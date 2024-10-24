import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/constants/colors.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final TextInputType inputType;
  final bool isPassword;
  final FormFieldValidator validatorFunction;

  const CustomInput({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.inputType,
    required this.validatorFunction,
    this.isPassword = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: context.locale.languageCode != 'ur'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        // Phone number input field
        TextFormField(
          obscureText: isPassword,
          controller: controller,
          onChanged: onChanged,
          keyboardType: inputType,
          // inputFormatters:  <TextInputFormatter>[
          //   WhitelistingTextInputFormatter.digitsOnly,
          // ],
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.whiteLight,
            contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
            errorStyle: TextStyle(
              color: AppColors.red, // Custom error text color
              fontSize: 12, // Custom error text size
            ),
          ),
          validator: validatorFunction,
        ),
      ],
    );
  }
}
