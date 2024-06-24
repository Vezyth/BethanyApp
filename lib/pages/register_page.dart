import 'dart:convert';
import 'package:bethany_app/pages/login_Page.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:http/http.dart' as http;
import 'package:bethany_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final telpController = TextEditingController();

  final tanggalController = TextEditingController();

  final nijController = TextEditingController();

  String tanggalLahir = "", userField = "", nomorField = "", passwordField = "";

  int gender = 1;

  String _emailErrorText = "";
  void _validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _emailErrorText = 'Email is required';
      });
    } else {
      setState(() {
        _emailErrorText = "";
      });
    }
  }

  bool isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 30),

            //logo
            const Icon(
              Icons.lock,
              size: 80,
            ),

            const SizedBox(height: 30),
            //Welcome back, you've been missed!
            Text(
              'Welcome back You\'ve been missed!',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            MyTextField(
              controller: nijController,
              hintText: 'NIJ',
              obscureText: false,
              fieldHeight: 10,
            ),

            const SizedBox(
              height: 10,
            ),

            //username text field
            MyTextField(
                controller: usernameController,
                hintText: 'Nama Lengkap',
                obscureText: false,
                fieldHeight: 10,
                errorText: userField,
                onChange: (String value) {
                  if (value.isEmpty) {
                    setState(() {
                      userField = 'Field is required';
                    });
                  } else {
                    setState(() {
                      userField = "";
                    });
                  }
                }),

            const SizedBox(
              height: 10,
            ),
            //email text field
            MyTextField(
              controller: telpController,
              hintText: 'Nomor Telpon',
              obscureText: false,
              fieldHeight: 10,
              inputType: TextInputType.phone,
              errorText: nomorField,
              onChange: (String value) {
                if (value.isEmpty) {
                  setState(() {
                    nomorField = 'Field is required';
                  });
                } else {
                  setState(() {
                    nomorField = "";
                  });
                }
              },
            ),

            const SizedBox(
              height: 10,
            ),

            MyTextField(
              controller: tanggalController,
              obscureText: false,
              hintText: "Tanggal Lahir",
              fieldHeight: 8,
              inputType: TextInputType.none,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(
                        1970), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                String? tanggalLahir = pickedDate
                    ?.toString()
                    .split(' ')[0]; // Use ? to handle null pickedDate
                if (tanggalLahir != null && tanggalLahir.isNotEmpty) {
                  tanggalController.text = tanggalLahir;
                } else {
                  tanggalController.text =
                      ""; // Set to empty string if tanggalLahir is null or empty
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),

            //password text field
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              fieldHeight: 10,
              errorText: _emailErrorText,
              onChange: _validateEmail,
            ),
            const SizedBox(
              height: 10,
            ),

            MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                fieldHeight: 10,
                errorText: passwordField,
                onChange: (String value) {
                  if (value.isEmpty) {
                    setState(() {
                      passwordField = 'Field is required';
                    });
                  } else {
                    setState(() {
                      passwordField = "";
                    });
                  }
                }),
            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text("Gender"),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text('Pria'),
                    value: 1,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('Wanita'),
                    value: 2,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            // forgot password

            const SizedBox(
              height: 20,
            ),

            //sign Up button

            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
              ),
              onTap: () async {
                // signUp();

                if (usernameController.text == "" ||
                    emailController.text == "" ||
                    passwordController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Fill all fields!")));
                } else {
                  try {
                    String uri =
                        "https://bethany-app.000webhostapp.com/user_add.php";

                    var res = await http.post(Uri.parse(uri), body: {
                      "NIJ": nijController.text,
                      "Full_Name": usernameController.text,
                      "Phone_Number": telpController.text,
                      "Born_Date": tanggalController.text,
                      "Email": emailController.text,
                      "Password": passwordController.text,
                      "Gender": gender.toString(),
                    });

                    var response = jsonDecode(res.body);

                    if (response["success"] == 1) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Register successfull!")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response["message"])));
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
            ),

            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have an account?',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  child: const Text(
                    'Login now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
                  },
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
