import 'package:bethany_app/pages/login_Page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Profile Page"),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: BorderRadius.circular(8)),
            child: const Center(
                child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LoginPage()));
          },
        ),
      ],
    );
  }
}
