import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Function()? onTap;
  final Function(String)? onChange;
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
  final bool onTapDatePicker;
  final String errorText;

  const MyTextField(
      {super.key,
      required this.controller,
      this.hintText = "",
      this.obscureText = false,
      this.fieldBottom = 10,
      this.fieldHeight = 10,
      this.fieldWidth = 8,
      this.fieldWidthRight = 8,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.paddingLeft = 25,
      this.paddingRight = 25,
      this.inputType = TextInputType.text,
      this.enabled = true,
      this.onTapDatePicker = false,
      this.onTap,
      this.errorText = "",
      this.onChange
      // this.onTap
      });

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
                child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              textAlignVertical: TextAlignVertical.top,
              keyboardType: inputType,
              enabled: enabled,
              decoration: InputDecoration(
                errorText: errorText == "" ? null : errorText,
                contentPadding: EdgeInsets.only(
                  top: fieldHeight,
                  bottom: fieldBottom,
                  left: fieldWidth,
                  right: fieldWidth,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                  // Add this line to set border

                  borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0), // Set border color and width
                ),
              ),
              validator: (value) => errorText,
              onChanged: onChange,
              onTap: onTap,
            )),
          ),
        ],
      ),
    );
  }
}
