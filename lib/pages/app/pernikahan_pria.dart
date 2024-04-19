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
