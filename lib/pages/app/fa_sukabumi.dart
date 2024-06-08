import 'package:flutter/material.dart';

class FaSukabumi extends StatelessWidget {
  const FaSukabumi({super.key});

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
        ),
        backgroundColor: Colors.grey[300],
        body: const Column(
          children: [
            Image(
              image: AssetImage("assets/banner1.jpg"),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '“Whatever we may be walking into,God has already stepped into it and prepared a way for us.”',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "FA Sukabumi",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Jl. Slamet Riyadi No. 43 Kec. Bumi Waras, Teluk Betung Bandar Lampung",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "+ 62 813 4372 6571",
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Wirawan Hiuredhy",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
