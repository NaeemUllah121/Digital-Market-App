import 'dart:ui';
import 'package:aser_application/utill/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintName;
  final TextInputType inputType;
  final int inputLines;
  final bool isPass;
  late bool passwordVisibility;
  CustomTextField({
    Key? key,
    this.controller,
    this.hintName,
    this.isPass = false,
    this.passwordVisibility = false,
    this.inputType = TextInputType.text, required this.inputLines,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: TextFormField(
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
            final emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
            final regExp = RegExp(emailPattern);
            if (!regExp.hasMatch(value)) {
              return 'Please enter a valid email';
            }
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color:  higherBlue),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color:  higherBlue),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: red),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: red),
          ),
          disabledBorder:   OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: lightestBlue),
          ),
          suffixIcon: widget.isPass
              ? IconButton(
            icon: Icon(
              widget.passwordVisibility
                  ? Icons.visibility
                  : Icons.visibility_off,
              color:  Colors.grey,
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
          hintStyle: TextStyle(fontSize: 14,color: black),

          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
