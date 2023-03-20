import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Display2 extends StatefulWidget {
  final String? scannedData;

  const Display2({Key? key, required this.scannedData}) : super(key: key);

  @override
  _Display2State createState() => _Display2State();
}

class _Display2State extends State<Display2> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('students').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        List<String> scores = [];
        List<String> naes = [];
        List<String> studentNames = [];
        List<String> Brand = [];
        List<String> name02 = [];
        List<String> name03 = [];
        List<String> name04 = [];
        List<String> name05 = [];
        snapshot.data?.docs.forEach((document) {
          final String? score = document['score']?.toString();
          final String? name = document['fname']?.toString();
          final String? nae = document['name']?.toString();
          final String? Brands = document['Brand']?.toString();
          final String? names2 = document['CD']?.toString();
          final String? names3 = document['CF']?.toString();
          final String? names4 = document['NC']?.toString();
          final String? names5 = document['cname']?.toString();
          if (score == widget.scannedData) {
            studentNames.add(name ?? '');
            scores.add(score ?? '');
            naes.add(nae ?? '');
            Brand.add(Brands ?? '');
            name02.add(names2 ?? '');
            name03.add(names3 ?? '');
            name04.add(names4 ?? '');
            name05.add(names5 ?? '');
          }
        });

        if (studentNames.isNotEmpty) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.100), // กำหนดความสูงของ AppBar
              child: SafeArea(
                child: AppBar(
                  backgroundColor:
                      Colors.black.withOpacity(0.6), // กำหนดพื้นหลังเป็นโปร่งใส
                  elevation: 10, // กำหนดความสูงของ AppBar เป็น 0 เพื่อลบเงา
                  shape: RoundedRectangleBorder(
                    // กำหนดรูปร่างของ AppBar เป็นวงกลม
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(30),
                    ),
                  ),
                  title: Text(
                    "แอป",
                    textAlign: TextAlign.center, // กำหนดให้ข้อความอยู่ตรงกลาง
                  ),
                  centerTitle: true, // เซ็ตค่าให้ title อยู่ตรงกลาง
                ),
              ),
            ),
            body: SingleChildScrollView(
              primary: true,
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 1),
                // alignment: Alignment.center,
                child: Center(
                  // padding: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
                  child: Column(
                    children: [
                      Image(
                        width: 200, // กำหนดความกว้างของรูปเป็น 200 pixels
                        height: 200, // กำหนดความสูงของรูปเป็น 200 pixels
                        image: NetworkImage(
                            'https://media.discordapp.net/attachments/747780435773227069/1080153072195612752/tablet-disintegration-tester-dt-1000-250x250.png'),
                      ),
                      SizedBox(height: 15),
                      ...List.generate(
                        studentNames.length,
                        (index) => Column(
                          children: [
                            Text(
                              'Company name: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              name05[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Machine name : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              naes[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Model : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              Brand[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Serial Number : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              scores[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Brand : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              Brand[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Calibration Date :',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              name02[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Calibration Frequency : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              name03[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Next Calibration : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              (name04[index]),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.100), // กำหนดความสูงของ AppBar
              child: SafeArea(
                child: AppBar(
                  backgroundColor:
                      Colors.black.withOpacity(0.6), // กำหนดพื้นหลังเป็นโปร่งใส
                  elevation: 10, // กำหนดความสูงของ AppBar เป็น 0 เพื่อลบเงา
                  shape: RoundedRectangleBorder(
                    // กำหนดรูปร่างของ AppBar เป็นวงกลม
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(30),
                    ),
                  ),
                  title: Text(
                    "แอป",
                    textAlign: TextAlign.center, // กำหนดให้ข้อความอยู่ตรงกลาง
                  ),
                  centerTitle: true, // เซ็ตค่าให้ title อยู่ตรงกลาง
                ),
              ),
            ),
            body: Center(
              child: Text('ไม่พบข้อมูล'),
            ),
          );
        }
      },
    );
  }
}
