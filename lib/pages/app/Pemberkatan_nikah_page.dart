import 'package:bethany_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class PemberkatanNikahPage extends StatefulWidget {
  const PemberkatanNikahPage({super.key});

  @override
  State<PemberkatanNikahPage> createState() => _PemberkatanNikahPageState();
}

class _PemberkatanNikahPageState extends State<PemberkatanNikahPage> {
  final hariController = TextEditingController();
  final tanggalController = TextEditingController();
  final jamController = TextEditingController();
  final alamatController = TextEditingController();
  final telpController = TextEditingController();

  int bersedia = 1;

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
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Expanded(child: Text("Hari")),
                              Expanded(child: Text("Tanggal")),
                              Expanded(child: Text(" Jam"))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: MyTextField(
                              controller: hariController,
                              obscureText: false,
                              fieldHeight: 10,
                              paddingRight: 0,
                            )),
                            Expanded(
                                child: MyTextField(
                              controller: tanggalController,
                              obscureText: false,
                              fieldHeight: 10,
                              paddingLeft: 5,
                              paddingRight: 5,
                            )),
                            Expanded(
                                child: MyTextField(
                              controller: jamController,
                              obscureText: false,
                              fieldHeight: 10,
                              paddingLeft: 0,
                            )),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Text("Alamat Lengkap setelah menikah"),
                        ],
                      ),
                    ),
                    MyTextField(
                      controller: alamatController,
                      hintText: "",
                      obscureText: false,
                      fieldBottom: 50,
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
                      controller: telpController,
                      hintText: "",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Data ini telah kami isi sesuai dengan yang sebenarnya. kami bertanggung jawab sepenuhnya akan hal tersebut. Dan kami bersedia memenuhi persyaratan untuk pemberkatan Nikah di Bethany Lampung",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),

                    // button kirim

                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Checkbox(
                            value: bersedia == 1 ? true : false,
                            onChanged: (value) {
                              setState(() {
                                bersedia = bersedia == 1 ? 0 : 1;
                              });
                            },
                          ),
                          const Text("Kami setuju dengan pernyataan diatas.")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
