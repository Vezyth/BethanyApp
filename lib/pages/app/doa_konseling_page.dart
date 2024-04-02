import 'package:bethany_app/components/my_radioButton.dart';
import 'package:bethany_app/components/my_textfield.dart';
import 'package:bethany_app/controller/button_controller.dart';
import 'package:bethany_app/pages/nav_pages/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoaPage extends StatelessWidget {
  DoaPage({super.key});

  final testController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String ValueChoose;
    List listItem = ["item1", "item2", "item3"];
    Get.put(ButtonController());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const AppPage()));
          },
        ),
        centerTitle: true,
        title: const Text("Doa & Konseling"),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 8, left: 8, bottom: 250, top: 8),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.white)),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Scaffold(
                  body: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      //TextField
                      const Text("Nama Lengkap"),
                      MyTextField(
                          controller: testController,
                          hintText: "Nama Lengkap",
                          obscureText: false),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Nomor Handphone"),
                      MyTextField(
                          controller: usernameController,
                          hintText: "Nomor Handphone",
                          obscureText: false),
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
                                  controller: testController,
                                  hintText: "Umur",
                                  obscureText: false)),
                          const MyRadioButton(gender: "Pria", title: "Pria"),
                          const MyRadioButton(
                              gender: "Wanita", title: "Wanita"),
                          const SizedBox(
                            width: 30.0,
                          )
                        ],
                      ),
                      //kategori
                      const Padding(
                        padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                        child: Row(
                          children: [Text("Kategori")],
                        ),
                      ),
                      DropdownButton(value: ValueChoose, onChanged: ()),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
