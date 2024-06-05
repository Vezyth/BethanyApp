import 'package:bethany_app/components/my_card.dart';

import 'package:bethany_app/pages/app/fa_sukabumi.dart';
import 'package:flutter/material.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text("Pernikahan"),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                MyCard(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const FaSukabumi()));
                                    },
                                    text: "FA Teluk Betung",
                                    imagePath:
                                        'https://via.placeholder.com/80'),
                                MyCard(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const FaSukabumi()));
                                    },
                                    text: "FA Sukabumi",
                                    imagePath: "https://via.placeholder.com/80")
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            MyCard(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const FaSukabumi()));
                                },
                                text: "FA Teluk Betung",
                                imagePath: 'https://via.placeholder.com/80'),
                            MyCard(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const FaSukabumi()));
                                },
                                text: "FA Sukabumi",
                                imagePath: "https://via.placeholder.com/80")
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
