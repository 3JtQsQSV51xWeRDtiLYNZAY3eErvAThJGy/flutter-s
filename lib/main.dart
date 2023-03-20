import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sgan/scriss/display.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:sgan/scriss/display01.dart';
import 'package:sgan/scriss/screen1.dart';
// ignore: unused_import
import 'model/student.dart';
import 'scriss/formscreen.dart';

void main() async {
  // สร้าง Firebase app ก่อนที่จะเรียกใช้งานคุณสมบัติอื่น ๆ ของ Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ทำสิ่งที่คุณต้องการกับ Firebase ต่อไปนี้
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? scannedData;
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50, // กำหนดความสูงของ SizedBox เท่ากับความสูงของ AppBar
            ),
            Center(
              child: Image(
                width: 300, // กำหนดความกว้างของรูปเป็น 200 pixels
                height: 300, // กำหนดความสูงของรูปเป็น 200 pixels
                image: NetworkImage(
                  'https://media.discordapp.net/attachments/747780435773227069/1080153452522508429/cropped-125833576_100845955197117_7125048327001744835_n-1.png',
                ),
              ),
            ),
            SizedBox(height: 100), // เพิ่มช่องว่างระหว่างรูปกับ Text

            TextButton(
              onPressed: () async {
                var cameraStatus = await Permission.camera.status;

                if (cameraStatus.isGranted) {
                  String? cameraScanResult = await scanner.scan();
                  setState(() {
                    scannedData = cameraScanResult;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Display2(scannedData: scannedData),
                      ),
                    );
                  });
                } else {
                  var cameraPermissionResult =
                      await Permission.camera.request();
                }
              },
              child: Text(
                "กดสแกนเลย",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => MyApp01()),
            //     );
            //   },
            //   child: Text('Click me'),
            // ),
          ],
        ),
      ),
    );
  }
}
