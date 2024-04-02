import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(
          image: AssetImage("assets/banner1.jpg"),
          fit: BoxFit.cover,
        ),
        Text(
          "Gereja Bethany Lampung",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          "Perumahan Bumi Asri Jl. Cendana III No.blok L,Kedamaian, Kec. Kedamaian, Kota Bandar Lampung, Lampung 35122",
          style: TextStyle(
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "+ 62 813 4372 6571",
          style: TextStyle(color: Colors.red),
        ),
        Text(
          "Pdt. Linda Senduk",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.email, color: Colors.grey),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.play_circle_fill_outlined, color: Colors.grey),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Saturday",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "19:00 WIB",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Youth Bethany Lampung",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Sunday",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "19:00 WIB",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Youth Bethany Lampung",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "19:00 WIB",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Youth Bethany Lampung",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Persembahan & Persepuluhan dapat ditransfer ke rekening berikut: ",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          "Ibu Linda Senduk & Ibu Masri (Rekening Bersama)",
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          "561.700.6316",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 135 - 9.5,
        )
      ],
    );

    // return Scaffold(
    //   body: SafeArea(
    //     child: Center(
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    //         child:
    //             Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //           Image.asset(
    //             "assets/banner1.jpg",
    //             fit: BoxFit.cover,
    //           ),
    //           const Text(
    //             "Gereja Bethany Lampung",
    //             style: TextStyle(fontWeight: FontWeight.w600),
    //           ),
    //           const Text(
    //             "Perumahan Bumi Asri Jl. Cendana III No.blok L,Kedamaian, Kec. Kedamaian, Kota Bandar Lampung, Lampung 35122",
    //             style: TextStyle(
    //               color: Colors.grey,
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //           const Text(
    //             "+ 62 813 4372 6571",
    //             style: TextStyle(color: Colors.red),
    //           ),
    //           const Text(
    //             "Pdt. Linda Senduk",
    //             style: TextStyle(fontWeight: FontWeight.w600),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           const Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Icon(
    //                 Icons.email,
    //                 color: Colors.grey,
    //               ),
    //               SizedBox(
    //                 width: 10,
    //               ),
    //               Icon(Icons.email, color: Colors.grey),
    //               SizedBox(
    //                 width: 10,
    //               ),
    //               Icon(Icons.play_circle_fill_outlined, color: Colors.grey),
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           const Text(
    //             "Saturday",
    //             style: TextStyle(color: Colors.red),
    //           ),
    //           const Row(
    //             children: [
    //               Text(
    //                 "19:00 WIB",
    //                 style: TextStyle(color: Colors.grey),
    //               ),
    //               SizedBox(
    //                 width: 20,
    //               ),
    //               Text(
    //                 "Youth Bethany Lampung",
    //                 style: TextStyle(color: Colors.grey),
    //               )
    //             ],
    //           ),
    //           const Positioned(
    //             left: 0,
    //             child: Text(
    //               "Sunday",
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           const Row(
    //             children: [
    //               Text(
    //                 "19:00 WIB",
    //                 style: TextStyle(color: Colors.grey),
    //               ),
    //               SizedBox(
    //                 width: 20,
    //               ),
    //               Text(
    //                 "Youth Bethany Lampung",
    //                 style: TextStyle(color: Colors.grey),
    //               )
    //             ],
    //           ),
    //           const Row(
    //             children: [
    //               Text(
    //                 "19:00 WIB",
    //                 style: TextStyle(color: Colors.grey),
    //               ),
    //               SizedBox(
    //                 width: 20,
    //               ),
    //               Text(
    //                 "Youth Bethany Lampung",
    //                 style: TextStyle(color: Colors.grey),
    //               )
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           const Text(
    //             "Persembahan & Persepuluhan dapat ditransfer ke rekening berikut: ",
    //             style: TextStyle(color: Colors.grey),
    //           ),
    //           const Text(
    //             "Ibu Linda Senduk & Ibu Masri (Rekening Bersama)",
    //             style: TextStyle(color: Colors.grey),
    //           ),
    //           const Text(
    //             "561.700.6316",
    //             style:
    //                 TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
    //           ),
    //           const SizedBox(
    //             height: 135,
    //           )
    //         ]),
    //       ),
    //     ),
    //   ),
    // );
  }
}
