import 'dart:convert';
import 'package:bethany_app/pages/app/Pemberkatan_nikah_page.dart';
import 'package:bethany_app/pages/app/doa_konseling_page.dart';
import 'package:bethany_app/pages/login_Page.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:bethany_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
              fieldHeight: 10,
              
            ),

            const SizedBox(
              height: 20,
            ),
            //email text field
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              fieldHeight: 10,
              
              
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
              
            ),

            // forgot password
            const SizedBox(
              height: 20,
            ),

            const SizedBox(
              height: 50,
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
                      "name": usernameController.text,
                      "email": emailController.text,
                      "password": passwordController.text
                    });

                    var response = jsonDecode(res.body);

                    if (response["success"] == 1) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Register successfull!")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: const Text("Register Failed!")));
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
                        builder: (BuildContext context) =>  const MainPage()));
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
