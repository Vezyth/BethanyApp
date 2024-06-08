import 'dart:convert';

import 'package:bethany_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PemberkatanNikahPage extends StatefulWidget {
  final List<String> groomInfo;
  final List<String> brideInfo;
  const PemberkatanNikahPage(
      {super.key, required this.brideInfo, required this.groomInfo});

  @override
  State<PemberkatanNikahPage> createState() => _PemberkatanNikahPageState();
}

class _PemberkatanNikahPageState extends State<PemberkatanNikahPage> {
  final hariController = TextEditingController();
  final tanggalController = TextEditingController();
  final jamController = TextEditingController();
  final alamatSetelahController = TextEditingController();
  final telpController = TextEditingController();

  int bersedia = 1;
  String tanggalPemberkatan = "";

  Future<void> kirimPermohonan() async {
    if (telpController == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("please fill all fields")));
    } else if (bersedia == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("please fill all fields")));
    } else {
      try {
        String uri = "https://bethany-app.000webhostapp.com/baptism_add.php";

        var res = await http.post(Uri.parse(uri), body: {
          "Groom_Name": widget.groomInfo[0],
          "Groom_Address": widget.groomInfo[1],
          "Groom_Phone_Number": widget.groomInfo[2],
          "Groom_Home_Number": widget.groomInfo[3],
          "Groom_Born_Place": widget.groomInfo[4],
          "Groom_Born_Date": widget.groomInfo[5],
          "Groom_Father": widget.groomInfo[6],
          "Groom_Mother": widget.groomInfo[7],
          "Bride_Name": widget.brideInfo[0],
          "Bride_Address": widget.brideInfo[1],
          "Bride_Phone_Number": widget.brideInfo[2],
          "bride_Home_Number": widget.brideInfo[3],
          "Bride_Born_Place": widget.brideInfo[4],
          "Bride_Born_Date": widget.brideInfo[5],
          "Bride_Father": widget.brideInfo[6],
          "Bride_Mother": widget.brideInfo[7],
          "Blessing_Date": tanggalController,
          "Address_After_Married": alamatSetelahController,
          "Phone_After_Married": telpController,
          "BrideGroom_Approval": bersedia == 1 ? "True" : "False",
        });

        var response = jsonDecode(res.body);
        if (response["success"] == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("pendaftaran terkirim!")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response["message"])));
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
                    MyTextField(
                      controller: tanggalController,
                      obscureText: false,
                      fieldHeight: 8,
                      paddingLeft: 0,
                      inputType: TextInputType.number,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        tanggalPemberkatan = pickedDate.toString();
                        tanggalController.text = tanggalPemberkatan;
                      },
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
                      controller: alamatSetelahController,
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
