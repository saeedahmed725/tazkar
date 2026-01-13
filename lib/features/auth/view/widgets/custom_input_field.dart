import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final List<String>? autofillHints;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.validator, this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      obscureText: isPassword,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
      ),
    );
  }
}
