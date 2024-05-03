import 'dart:convert';

import 'package:bethany_app/components/my_app.dart';
import 'package:bethany_app/pages/app/doa_konseling_page.dart';
import 'package:bethany_app/pages/app/pernikahan_pria.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  //Bible API

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  String _references = "";
  String _text = "";
  Future getVerse() async {
    var response =
        await http.get(Uri.http("bible-api.com", "", {"random": "verse"}));
    var jsonData = jsonDecode(response.body);
    var reference = jsonData['reference'];
    var text = jsonData['text'];
    _references = reference;
    _text = text;
  }

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
        Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const DoaPage()));
                    },
                    name: "\nDoa & Konseling",
                    imagePath: "assets/pray.png")),
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PernikahanPriaPage()));
                    },
                    name: "\nFamily Altar",
                    imagePath: "assets/bible.png")),
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "\nSOM",
                    imagePath: "assets/blackboard.png")),
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>  PernikahanPriaPage()));
                    },
                    name: "\nPernikahan",
                    imagePath: "assets/blackboard.png")),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, top: 25),
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
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "\nContact Us",
                    imagePath: "assets/pray.png")),
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "\nBethany Nginden",
                    imagePath: "assets/pray.png")),
            const SizedBox(width: 185),
          ],
        ),
        const SizedBox(height: 130),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                "Bible verse of the day",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        FutureBuilder(
            future: getVerse(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(_references),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 10, right: 8),
                      child: Positioned(
                        width: MediaQuery.of(context).size.width,
                        bottom: 0,
                        child: Text(
                          _text,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.amber),
                            borderRadius: BorderRadius.circular(10)),
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ],
    ));
  }
}
