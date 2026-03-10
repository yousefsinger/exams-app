import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String errorText;
  final TextInputType keyboardType;
  final bool isObscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.validator,
    this.controller,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: isObscureText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(labelText: label, hintText: hint,errorText: errorText),
      ),
    );
  }
}
