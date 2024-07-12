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
        title: const Text(
          'Profile Page',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: userInfo.isEmpty
          ? EmptyProfileWidget(
              onLogin: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                );
              },
            )
          : FilledProfileWidget(
              userInfo: userInfo,
              onLogout: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('userInfo');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const MainPage()),
                );
              },
            ),
    );
  }
}

class EmptyProfileWidget extends StatelessWidget {
  final VoidCallback onLogin;

  const EmptyProfileWidget({Key? key, required this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
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
        onTap: onLogin,
      ),
    );
  }
}

class FilledProfileWidget extends StatelessWidget {
  final List<String> userInfo;
  final VoidCallback onLogout;

  const FilledProfileWidget(
      {Key? key, required this.userInfo, required this.onLogout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(userInfo[0],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(userInfo[2], style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(userInfo[3], style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Phone Number",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(userInfo[1], style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Gender",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(userInfo[4] == "1" ? "Pria" : "Wanita",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
            ],
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
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
