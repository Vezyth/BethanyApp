import 'package:bethany_app/components/my_app.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text(
          "Bethany Lampung App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "Doa & Konseling",
                    imagePath:
                        "https://cdn.discordapp.com/attachments/852892372072923147/1215443037174632468/image.png?ex=65fcc489&is=65ea4f89&hm=cda9aab434ba60dceae373d5ea99f890be602d8e47da2147a49c5c03921a63c0&")),
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "\nFamily Altar",
                    imagePath:
                        "https://cdn.discordapp.com/attachments/852892372072923147/1215443037174632468/image.png?ex=65fcc489&is=65ea4f89&hm=cda9aab434ba60dceae373d5ea99f890be602d8e47da2147a49c5c03921a63c0&")),
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "\nSOM",
                    imagePath:
                        "https://cdn.discordapp.com/attachments/852892372072923147/1215443037174632468/image.png?ex=65fcc489&is=65ea4f89&hm=cda9aab434ba60dceae373d5ea99f890be602d8e47da2147a49c5c03921a63c0&")),
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "\nPernikahan",
                    imagePath:
                        "https://cdn.discordapp.com/attachments/852892372072923147/1215443037174632468/image.png?ex=65fcc489&is=65ea4f89&hm=cda9aab434ba60dceae373d5ea99f890be602d8e47da2147a49c5c03921a63c0&")),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Informations",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "\nContact Us",
                    imagePath:
                        "https://cdn.discordapp.com/attachments/852892372072923147/1215443037174632468/image.png?ex=65fcc489&is=65ea4f89&hm=cda9aab434ba60dceae373d5ea99f890be602d8e47da2147a49c5c03921a63c0&")),
            const SizedBox(width: 10),
            Expanded(
                child: MyApp(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const MainPage()));
                    },
                    name: "Bethany Nginden",
                    imagePath:
                        "https://cdn.discordapp.com/attachments/852892372072923147/1215443037174632468/image.png?ex=65fcc489&is=65ea4f89&hm=cda9aab434ba60dceae373d5ea99f890be602d8e47da2147a49c5c03921a63c0&")),
            const SizedBox(width: 185),
          ],
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
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
        )
      ],
    ));
  }
}
