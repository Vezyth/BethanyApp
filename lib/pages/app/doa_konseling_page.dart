import 'package:bethany_app/components/my_radioButton.dart';
import 'package:bethany_app/components/my_textfield.dart';
import 'package:bethany_app/controller/button_controller.dart';
import 'package:bethany_app/pages/nav_pages/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<String> list = <String>[
  'Bisnis dan Keuangan',
  'Hubungan dan Pertemanan',
  'Keluarga, Saudara dan Pernihakan',
  'Kesehatan',
  "Keselamatan",
  "Studi dan Sekolah",
  "Lainnya"
];

class DoaPage extends StatelessWidget {
  DoaPage({super.key});

  final testController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(
                  right: 10, left: 10, bottom: 100, top: 10),
              child: Scaffold(
                body: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    //TextField
                    const Text("Nama Lengkap"),
                    MyTextField(
                      controller: testController,
                      hintText: " Nama Lengkap",
                      obscureText: false,
                      fieldHeight: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Nomor Handphone"),
                    MyTextField(
                      controller: usernameController,
                      hintText: " Nomor Handphone",
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
                          controller: testController,
                          hintText: " Umur",
                          obscureText: false,
                          fieldHeight: 10,
                        )),
                        const MyRadioButton(gender: "Pria", title: "Pria"),
                        const MyRadioButton(gender: "Wanita", title: "Wanita"),
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
                    const DropdownButtonExample(),
                    const Text("Permintaan Khusus"),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: testController,
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
                      height: 20,
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

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 25,
        left: 25,
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        // icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),

        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
