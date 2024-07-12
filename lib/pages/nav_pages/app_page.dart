import 'package:bethany_app/components/my_app.dart';
import 'package:bethany_app/pages/app/baptis_page.dart';
import 'package:bethany_app/pages/app/doa_konseling_page.dart';
import 'package:bethany_app/pages/app/family_page.dart';
import 'package:bethany_app/pages/app/pernikahan_pria.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Text(
                "Bethany Lampung App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const DoaPage()));
                  },
                  name: "Doa & Konseling",
                  imagePath: "assets/pray.png",
                  isVisible: true,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const FamilyPage()));
                  },
                  name: "Family Altar",
                  imagePath: "assets/bible.png",
                  isVisible: true,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const PernikahanPriaPage()));
                  },
                  name: "\nPernikahan",
                  imagePath: "assets/blackboard.png",
                  isVisible: true,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const BaptisPage()));
                  },
                  name: "\nBaptisan",
                  imagePath: "assets/blackboard.png",
                  isVisible: true,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const BaptisPage()));
                  },
                  name: "\nBaptisan",
                  imagePath: "assets/blackboard.png",
                  isVisible: false,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {},
                  name: "Contact Us",
                  imagePath: "assets/pray.png",
                  isVisible: false,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const MainPage()));
                  },
                  name: "Contact Us",
                  imagePath: "assets/pray.png",
                  isVisible: false,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const MainPage()));
                  },
                  name: "Contact Us",
                  imagePath: "assets/pray.png",
                  isVisible: false,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: Row(
            children: [
              Text(
                "Informations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const MainPage()));
                  },
                  name: "\nContact Us",
                  imagePath: "assets/pray.png",
                  isVisible: true,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const MainPage()));
                  },
                  name: "Bethany Nginden",
                  imagePath: "assets/pray.png",
                  isVisible: true,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const MainPage()));
                  },
                  name: "Contact Us",
                  imagePath: "assets/pray.png",
                  isVisible: false,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: MyApp(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const MainPage()));
                  },
                  name: "Contact Us",
                  imagePath: "assets/pray.png",
                  isVisible: false,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    ));
  }
}
