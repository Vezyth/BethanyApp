import 'dart:convert';

import 'package:bethany_app/components/my_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:flutter/material.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  int permintaan = 1, gender = 1;
  bool bersedia = false;

  final nameController = TextEditingController();
  final nomorController = TextEditingController();
  final umurController = TextEditingController();
  final permintaanController = TextEditingController();

  Future<void> kirimPermohonan() async {
    if (nameController.text == "" ||
        nomorController.text == "" ||
        umurController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill all the fields")));
    } else {
      try {
        String uri = "https://bethany-app.000webhostapp.com/doa_add.php";

        var res = await http.post(Uri.parse(uri), body: {
          "nama_lengkap": nameController.text,
          "nomor_handphone": 0123456789,
          "umur": 12,
          "gender": 1,
          "kategori": 1,
          "permintaan_khusus": permintaanController.text,
          "bersedia_dihubungi": true,
        });

        var response = jsonDecode(res.body);
        if (response["success"] == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Permintaan berhasil dikirim")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Gagal")));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const MainPage()));
          },
        ),
        centerTitle: true,
        title: const Text("Doa & Konseling"),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Scaffold(
                body: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    //TextField
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Text("Nama Lengkap"),
                        ],
                      ),
                    ),
                    MyTextField(
                      controller: nameController,
                      hintText: "Nama Lengkap",
                      obscureText: false,
                      fieldHeight: 8,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Text("Nomor Handphone"),
                        ],
                      ),
                    ),
                    MyTextField(
                      controller: nomorController,
                      hintText: "Nomor Handphone",
                      obscureText: false,
                      fieldHeight: 10,
                    ),
                    // umur & gender
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: Row(
                        children: [
                          Text("Umur"),
                          SizedBox(
                            width: 100,
                          ),
                          Text("Gender")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MyTextField(
                          controller: umurController,
                          hintText: "Umur",
                          obscureText: false,
                          fieldHeight: 8,
                        )),
                        Expanded(
                          child: Column(children: [
                            RadioListTile(
                              title: const Text('Pria'),
                              value: 1,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text('Wanita'),
                              value: 2,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                          ]),
                        ),
                        const SizedBox(
                          width: 30.0,
                        )
                      ],
                    ),
                    //kategori
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [Text("Kategori")],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text('Bisnis dan Keuangan'),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text('Hubungan dan Pertemanan'),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text('Keluarga, Saudara dan Pernikahan'),
                          ),
                          DropdownMenuItem(
                            value: 4,
                            child: Text('Kesehatan'),
                          ),
                          DropdownMenuItem(
                            value: 5,
                            child: Text('Keselamatan'),
                          ),
                          DropdownMenuItem(
                            value: 6,
                            child: Text('Studi dan Sekolah'),
                          ),
                          DropdownMenuItem(
                            value: 7,
                            child: Text('Lainnya'),
                          ),
                        ],
                        value: permintaan,
                        onChanged: (value) {
                          setState(() {
                            permintaan = value!;
                          });
                        },
                        isExpanded: true,
                      ),
                    ),
                    const Text("Permintaan Khusus"),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: permintaanController,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[500])),
                      ),
                    ),
                    const Text("ini ga tau gimana :v"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Setiap permohonan doa yang masuk akan didoakan oleh tim pendoa kami. Hanya kasus-kasus tertentu yang akan dilayani oleh tim konseling. Tim kami berhak menentukan doa/kasus yang perlu ditangani lebih lanjut.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    //checkbox

                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {
                            setState(() {
                              bersedia = value!;
                            });
                          },
                        ),
                        const Text("Saya bersedia dihubungi untuk konseling.")
                      ],
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
                          "Kirim",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                      onTap: () {
                        kirimPermohonan();
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
