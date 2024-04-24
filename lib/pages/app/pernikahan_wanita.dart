import 'package:bethany_app/components/my_textfield.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:flutter/material.dart';

class PernikahanWanitaPage extends StatelessWidget {
  PernikahanWanitaPage({super.key});

  final nameController = TextEditingController();

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
        title: const Text("Pernikahan"),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(
                            "Data Calon Mempelai Wanita",
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
                      hintText: "Nama Lengkap",
                      obscureText: false,
                      fieldHeight: 8,
                      fieldWidth: 200,
                    ),
                    const SizedBox(
                      height: 8,
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
                      hintText: "Nama Lengkap",
                      obscureText: false,
                      fieldHeight: 25,
                      fieldWidth: 200,
                    ),

                    //no telp

                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: Row(
                        children: [
                          Text("Nomor Hp"),
                          SizedBox(
                            width: 105,
                          ),
                          Text("Telp Rumah")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Nomor Hp",
                          obscureText: false,
                          fieldHeight: 8,
                          fieldWidth: 200,
                        )),
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Telp Rumah",
                          obscureText: false,
                          fieldHeight: 8,
                          fieldWidth: 200,
                        )),
                      ],
                    ),
                    // tempat tanggal lahir

                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: Row(
                        children: [
                          Text("Tempat Lahir"),
                          SizedBox(
                            width: 85,
                          ),
                          Text("Tanggal Lahir")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Tempat Lahir",
                          obscureText: false,
                          fieldHeight: 8,
                          fieldWidth: 200,
                        )),
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Tanggal Lahir",
                          obscureText: false,
                          fieldHeight: 8,
                          fieldWidth: 200,
                        )),
                      ],
                    ),

                    // nama orang tua

                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: Row(
                        children: [
                          Text("Nama Ayah Kandung"),
                          SizedBox(
                            width: 35,
                          ),
                          Text("Nama Ibu Kandung")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Nama Ayah Kandung",
                          obscureText: false,
                          fieldHeight: 8,
                          fieldWidth: 200,
                        )),
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Nama Ibu Kandung",
                          obscureText: false,
                          fieldHeight: 8,
                          fieldWidth: 200,
                        )),
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
                          "Kirim",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}