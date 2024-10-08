import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const Image(
            image: AssetImage("assets/banner1.jpg"),
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Gereja Bethany Lampung",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Perumahan Bumi Asri Jl. Cendana III No.blok L,Kedamaian, Kec. Kedamaian, Kota Bandar Lampung, Lampung 35122",
            style: TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "+ 62 813 4372 6571",
            style: TextStyle(color: Colors.amber),
          ),
          const Text(
            "Pdt. Linda Senduk",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
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
            height: MediaQuery.of(context).size.height / 35,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Saturday",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
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
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "07:30 WIB",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 20,
                      height: 10,
                    ),
                    Text(
                      "Service I & Sunday School",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "17:00 WIB",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Service II & Sunday School",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 50),
              child: Text(
                "Persembahan & Persepuluhan dapat ditransfer ke rekening berikut: ",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Ibu Linda Senduk & Ibu Masri (Rekening Bersama)",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "561.700.6316",
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
