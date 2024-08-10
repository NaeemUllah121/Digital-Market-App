// ignore_for_file: must_be_immutable

import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:flutter/material.dart';

class AddressTextFields extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintName;
  final TextInputType inputType;
  final int inputLines;
  final bool isPass;
  late bool passwordVisibility;

  AddressTextFields({
    Key? key,
    this.controller,
    this.hintName,
    this.isPass = false,
    this.passwordVisibility = false,
    this.inputType = TextInputType.text,
    required this.inputLines,
  }) : super(key: key);

  @override
  State<AddressTextFields> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<AddressTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPass ? !widget.passwordVisibility : false,
      keyboardType: widget.inputType,
      maxLines: widget.inputLines,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hintName}';
        }
    
        if (widget.inputType == TextInputType.emailAddress) {
          const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
          final regExp = RegExp(emailPattern);
          if (!regExp.hasMatch(value)) {
            return 'Please enter a valid email';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: ColorsManager.textFieldsBackground),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: ColorsManager.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: ColorsManager.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: ColorsManager.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: ColorsManager.lightestBlue),
        ),
        suffixIcon: widget.isPass
            ? IconButton(
                icon: Icon(
                  widget.passwordVisibility
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    widget.passwordVisibility = !widget.passwordVisibility;
                  });
                },
              )
            : const SizedBox.shrink(),
        hintText: widget.hintName,
        // hintStyle: TextStyle(fontSize: 10),
        hintStyle: TextStyle(fontSize: 14, color: ColorsManager.black),
        fillColor:  ColorsManager.textFieldsBackground,
        filled: true,
      ),
    );
  }
}
