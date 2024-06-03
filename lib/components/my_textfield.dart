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
  final bool enabled;

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
      this.inputType = TextInputType.text,
      this.enabled=true});

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
            child: Container(
  decoration: BoxDecoration(
    border: Border.all(color: enabled ? Colors.grey : Colors.grey.withOpacity(0.5)), 
    
  ),
  child: TextField(
    controller: controller,
    obscureText: obscureText,
    textAlignVertical: TextAlignVertical.top,
    keyboardType: inputType,
    enabled: enabled,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(
        top: fieldHeight,
        bottom: fieldBottom,
        left: fieldWidth,
        right: fieldWidth,
      ),
      fillColor: Colors.white,
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[500]),
      border: InputBorder.none, // Remove default border
    ),
  ),
),
            
          ),
        ],
      ),
    );
  }
}