import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final double fieldHeight;
  final double fieldBottom;
  final double fieldWidth;
  final double fieldWidthRight;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final TextInputType inputType;

  const MyTextField(
      {super.key,
      required this.controller,
      this.hintText = "",
      required this.obscureText,
      this.fieldBottom = 10,
      this.fieldHeight = 10,
      this.fieldWidth = 8,
      this.fieldWidthRight = 8,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.paddingLeft = 25,
      this.paddingRight = 25,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: paddingTop,
          bottom: paddingBottom,
          left: paddingLeft,
          right: paddingRight),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              textAlignVertical: TextAlignVertical.top,
              keyboardType: inputType,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: fieldHeight,
                      bottom: fieldBottom,
                      left: fieldWidth,
                      right: fieldWidth),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
          ),
        ],
      ),
    );
  }
}
