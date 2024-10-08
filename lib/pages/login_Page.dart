import 'dart:convert';

import 'package:bethany_app/components/my_textfield.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:bethany_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final nijController = TextEditingController();

  final passwordController = TextEditingController();

  //sign in method
  void signIn() {}

  String nijField = "", passwordField = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 50),

            //logo
            const Icon(
              Icons.lock,
              size: 100,
            ),

            const SizedBox(height: 50),
            //Welcome back, you've been missed!
            Text(
              'Welcome back You\'ve been missed!',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //username text field
            MyTextField(
              controller: nijController,
              hintText: 'NIJ',
              obscureText: false,
              fieldHeight: 10,
              errorText: nijField,
              onChange: (String value) {
                if (value.isEmpty) {
                  setState(() {
                    nijField = 'Field is required';
                  });
                } else {
                  setState(() {
                    nijField = "";
                  });
                }
              },
            ),

            const SizedBox(
              height: 20,
            ),
            //password text field
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
              },
            ),

            // forgot password
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            //sign in button

            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
              ),
              onTap: () async {
                if (nijController.text == "" || passwordController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Fill all fields!")));
                } else {
                  try {
                    String uri =
                        "https://bethany-app.000webhostapp.com/user_login.php";

                    var res = await http.post(Uri.parse(uri), body: {
                      "NIJ": nijController.text,
                      "Password": passwordController.text,
                    });

                    var response = jsonDecode(res.body);

                    if (response["success"] == 1) {
                      String uri1 =
                          "https://bethany-app.000webhostapp.com/user_info.php";

                      var res1 = await http.post(Uri.parse(uri1), body: {
                        "NIJ": nijController.text,
                      });

                      var response1 = jsonDecode(res1.body);
                      String fullName = response1["data"]["Full_Name"];
                      String phoneNumber = response1["data"]["Phone_Number"];
                      String bornDate = response1["data"]["Born_Date"];
                      String email = response1["data"]["Email"];
                      String gender = response1["data"]["Gender"];
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setStringList('userInfo', <String>[
                        fullName,
                        phoneNumber,
                        bornDate,
                        email,
                        gender
                      ]);

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Selamat Datang $fullName")));

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
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
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have no account?',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => RegisterPage()));
                    })
              ],
            )
          ]),
        ),
      ),
    );
  }
}
