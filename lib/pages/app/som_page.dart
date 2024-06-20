import 'package:bethany_app/components/my_card.dart';
import 'package:flutter/material.dart';

class SOMPage extends StatefulWidget {
  const SOMPage({super.key});

  @override
  State<SOMPage> createState() => _SOMPage();
}

class _SOMPage extends State<SOMPage> {
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
        title: const Text("Sekolah Orientasi Melayani"),
      ),
      backgroundColor: Colors.grey[300],
      body: const SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Pendaftaran Kelas",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Kelas belum tersedia"),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Text("Riwayat kelulusan kelas"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
