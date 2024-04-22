import 'package:bethany_app/components/my_textfield.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:flutter/material.dart';

class PernikahanPriaPage extends StatelessWidget {
  PernikahanPriaPage({super.key});

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
                      hintText: "Nama Lengkap",
                      obscureText: false,
                      fieldHeight: 8,
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
                        )),
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Telp Rumah",
                          obscureText: false,
                          fieldHeight: 8,
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
                        )),
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Tanggal Lahir",
                          obscureText: false,
                          fieldHeight: 8,
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
                        )),
                        Expanded(
                            child: MyTextField(
                          controller: nameController,
                          hintText: "Nama Ibu Kandung",
                          obscureText: false,
                          fieldHeight: 8,
                        )),
                      ],
                    ),
                    // button kirim

                    SizedBox(
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

  // Scaffold(
  //     appBar: AppBar(
  //       leading: BackButton(
  //         onPressed: () {
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(
  //               builder: (BuildContext context) => const MainPage()));
  //         },
  //       ),
  //       centerTitle: true,
  //       title: const Text("Doa & Konseling"),
  //     ),
  //     backgroundColor: Colors.grey[300],
  //     body: const SafeArea(
  //         child: Center(
  //       child: Padding(
  //         padding: EdgeInsets.all(10.0),
  //         child: Scaffold(
  //           body: Column(
  //             children: [
  //               Padding(
  //                   padding: EdgeInsets.all(8.0),
  //                   child: Text(
  //                     "Data Calon Mempelai Pria",
  //                     style:
  //                         TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
  //                   )),
  //               MyTextField(
  //                   controller: nameController,
  //                   hintText: "",
  //                   obscureText: true,
  //                   fieldHeight: 10)
  //             ],
  //           ),
  //         ),
  //       ),
  //     )),
  //   );
  // }
}
