import 'package:get/get.dart';

class ButtonController extends GetxController {
  String _gender = "Pria";
  String get gender => _gender;
  void setGender(String gender) {
    _gender = gender;
    update();
  }
}
