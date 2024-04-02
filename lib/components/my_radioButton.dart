import 'package:bethany_app/controller/button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRadioButton extends StatelessWidget {
  final String gender;
  final String title;

  const MyRadioButton({super.key, required this.gender, required this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonController>(builder: (buttonController) {
      return InkWell(
        onTap: () => buttonController.setGender(gender),
        child: Row(children: [
          Radio(
              value: gender,
              groupValue: buttonController.gender,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (String? gender) {}),
          Text(title)
        ]),
      );
    });
  }
}
