import 'package:bethany_app/pages/login_Page.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> userInfo = [];

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userInfo = prefs.getStringList('userInfo') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile Page", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            if (userInfo.isNotEmpty) ...[
              Text("Full Name: ${userInfo[0]}", style: TextStyle(fontSize: 18)),
              Text("Phone Number: ${userInfo[1]}",
                  style: TextStyle(fontSize: 18)),
              Text("Born Date: ${userInfo[2]}", style: TextStyle(fontSize: 18)),
              Text("Email: ${userInfo[3]}", style: TextStyle(fontSize: 18)),
              Text("Gender: ${userInfo[4]}", style: TextStyle(fontSize: 18)),
            ] else ...[
              Text("No user data found.", style: TextStyle(fontSize: 18)),
            ],
            SizedBox(height: 10),
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
              },
            ),
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('userInfo');

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => MainPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
