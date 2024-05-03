

import 'package:bethany_app/components/my_textfield.dart';
import 'package:bethany_app/pages/nav_pages/main_page.dart';
import 'package:flutter/material.dart';

class PemberkatanNikahPage extends StatefulWidget {
  const PemberkatanNikahPage({super.key});

  @override
  State<PemberkatanNikahPage> createState() => _PemberkatanNikahPageState();
}

class _PemberkatanNikahPageState extends State<PemberkatanNikahPage> {
  final nameController = TextEditingController();

  bool bersedia = false;

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
                            "Pemberkata Nikah",
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
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text("Hari"),
                          SizedBox(width: 95,),
                          Text("Tanggal"),
                          SizedBox(width: 80,),
                          Text("Jam")
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [

                        
                        Expanded(child: MyTextField(controller: nameController, hintText: "", obscureText: false, fieldHeight: 10,fieldWidth: 50,)),
                        Expanded(child: MyTextField(controller: nameController, hintText: "", obscureText: false, fieldHeight: 10,fieldWidth: 50,)),
                        Expanded(child: MyTextField(controller: nameController, hintText: "", obscureText: false, fieldHeight: 10,fieldWidth: 50,)),
                        
                      ],
                    ),
                    const SizedBox(height: 5,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Text("Alamat Lengkap setelah menikah"),
                        ],
                      ),
                    ),
                    MyTextField(
                      controller: nameController,
                      hintText: "",
                      obscureText: false,
                      fieldHeight: 50,fieldWidth: 50,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Text("Telp Rumah"),
                        ],
                      ),
                    ),
                    MyTextField(
                      controller: nameController,
                      hintText: "",
                      obscureText: false,
                      fieldHeight: 25,fieldWidth: 50,
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text("Data ini telah kami isi sesuai dengan yang sebenarnya. kami bertanggung jawab sepenuhnya akan hal tersebut. Dan kami bersedia memenuhi persyaratan untuk pemberkatan Nikah di Bethany Lampung", overflow: TextOverflow.clip,textAlign: TextAlign.justify, style: TextStyle(fontSize: 12),),
                    ),

                    
                    // button kirim

                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                           Checkbox(
                            value: bersedia,
                            onChanged: (value) {
                              setState(() {
                                bersedia = value!;
                              });
                            },
                          ),
                          const Text("Saya bersedia dihubungi untuk konseling.")
                        ],
                      ),
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