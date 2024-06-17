import 'dart:convert';

import 'package:bethany_app/components/my_textfield.dart';
import 'package:bethany_app/pages/app/pernikahan_wanita_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PernikahanPriaPage extends StatefulWidget {
  const PernikahanPriaPage({super.key});

  @override
  State<PernikahanPriaPage> createState() => _PernikahanPriaPageState();
}

class _PernikahanPriaPageState extends State<PernikahanPriaPage> {
  String tanggalLahir = "";

  final nameController = TextEditingController();

  final alamatController = TextEditingController();

  final telpController = TextEditingController();

  final hpController = TextEditingController();

  final tanggalController = TextEditingController();

  final tempatController = TextEditingController();

  final ayahController = TextEditingController();

  final ibuController = TextEditingController();

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
      body: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        height: 550,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Scaffold(
                body: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(
                            "Data Calon Mempelai Pria",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                      obscureText: false,
                      fieldHeight: 8,
                      paddingLeft: 25,
                      paddingRight: 25,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Text("Alamat Lengkap"),
                        ],
                      ),
                    ),
                    MyTextField(
                      controller: alamatController,
                      obscureText: false,
                      fieldHeight: 8,
                      fieldBottom: 50,
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Expanded(child: Text("Nomor Hp")),
                              Expanded(child: Text("Telp Rumah")),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: MyTextField(
                              controller: hpController,
                              obscureText: false,
                              fieldHeight: 8,
                              paddingRight: 5,
                              inputType: TextInputType.number,
                            )),
                            Expanded(
                                child: MyTextField(
                              controller: telpController,
                              obscureText: false,
                              fieldHeight: 8,
                              paddingLeft: 0,
                              inputType: TextInputType.number,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Expanded(child: Text("Tempat Lahir")),
                              Expanded(child: Text("Tanggal Lahir"))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: MyTextField(
                              controller: tempatController,
                              obscureText: false,
                              fieldHeight: 8,
                              inputType: TextInputType.none,
                              paddingRight: 5,
                            )),
                            Expanded(
                                child: MyTextField(
                              controller: tanggalController,
                              obscureText: false,
                              fieldHeight: 8,
                              paddingLeft: 0,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime.now(), //get today's date
                                    firstDate: DateTime(
                                        2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                tanggalLahir =
                                    pickedDate.toString().split(' ')[0];
                                if (tanggalLahir.isNotEmpty) {
                                  tanggalController.text =
                                      "${tanggalLahir.split('-')[0]}-${tanggalLahir.split('-')[1]}-${tanggalLahir.split('-')[2]}";
                                }
                              },
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Expanded(child: Text("Nama Ayah Kandung")),
                              Expanded(child: Text("Nama Ibu Kandung"))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: MyTextField(
                              controller: ayahController,
                              obscureText: false,
                              fieldHeight: 8,
                              paddingRight: 5,
                            )),
                            Expanded(
                                child: MyTextField(
                              controller: ibuController,
                              obscureText: false,
                              fieldHeight: 8,
                              paddingLeft: 0,
                            )),
                          ],
                        ),
                      ],
                    ),

                    // button kirim

                    const SizedBox(
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
                          "Selanjutnya",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                      onTap: () {
                        if (nameController == "" ||
                            alamatController == "" ||
                            hpController == "" ||
                            telpController == "" ||
                            tempatController == "" ||
                            tanggalController == "" ||
                            ayahController == "" ||
                            ibuController == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("please fill all fields")));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PernikahanWanitaPage(
                                Groom_Name: nameController.text,
                                Groom_Address: alamatController.text,
                                Groom_Home_Number: telpController.text,
                                Groom_Phone_Number: hpController.text,
                                Groom_Born_Date: tanggalController.text,
                                Groom_Born_Place: tempatController.text,
                                Groom_Father: ayahController.text,
                                Groom_Mother: ibuController.text,
                              ),
                            ),
                          );
                        }
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
