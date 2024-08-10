import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utill/constants/color_manager.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String hint;
  final bool obscureText; // Flag to indicate password or email
  final String? Function(String?)? validator;
  final Widget? prefixIcon; // Optional prefix icon
  final TextEditingController controller;
  const TextFormFieldWidget({
    Key? key,
    required this.hint,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:
              const BorderSide(color: ColorsManager.strokeColr, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:
              const BorderSide(color: ColorsManager.strokeColr, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:
              const BorderSide(color: ColorsManager.strokeColr, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:
              const BorderSide(color: ColorsManager.strokeColr, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 16.h),
        filled: true,
        fillColor: ColorsManager.fillcolr,
        hintText: widget.hint,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : null, // Only show suffix icon for password fields
        hintStyle: TextStyle(
          fontSize: 12.sp,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          color: ColorsManager.hintColr,
        ),
      ),
      obscureText: widget.obscureText ? !_showPassword : false,
      validator: widget.validator,
    );
  }
}

// Usage example:

String? validateEmail(String? email) {
  final emailRegex = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$");
  return email == null || email.isEmpty || !emailRegex.hasMatch(email)
      ? "Please enter a valid email address"
      : null;
}

String? validatePassword(String? password) {
  final passwordRegex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
  return password == null ||
          password.isEmpty ||
          !passwordRegex.hasMatch(password)
      ? "Password must be at least 8 characters and include at least one lowercase letter, uppercase letter, number, and special character (@*?&)"
      : null;
}
