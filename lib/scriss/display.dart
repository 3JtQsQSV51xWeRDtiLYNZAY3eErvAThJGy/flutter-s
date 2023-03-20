import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class display1 extends StatefulWidget {
  // const display1({super.key});
  final String? scannedData;

  const display1({Key? key, this.scannedData}) : super(key: key);

  @override
  State<display1> createState() => _display1State();
}

class _display1State extends State<display1> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('number');
    return Scaffold(
      appBar: AppBar(title: Text("รายงานคะแนนสอบ")),
      body: FutureBuilder<QuerySnapshot>(
        future: users.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("loading");
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text("${data["numbear01"]}"),
                  // subtitle: Text("${data["score"]}"),
                );
              },
            );
          }

          return Text("No data available");
        },
      ),
    );
  }
}

// class display1 extends StatefulWidget {
//   final String? scannedData;

//   const display1({Key? key, this.scannedData}) : super(key: key);
//   @override
//   State<display1> createState() => _display1State();
// }

// class _display1State extends State<display1> {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('students');
//     return Scaffold(
//       appBar: AppBar(title: Text("รายงานคะแนนสอบ")),
//       body: Column(
//         children: [
//           Text(
//             "รายชื่อนักเรียนที่สอบแล้ว",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           FutureBuilder<QuerySnapshot>(
//             future: users.get(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text("Something went wrong");
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Text("loading");
//               }

//               if (snapshot.hasData) {
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, index) {
//                       Map<String, dynamic> data = snapshot.data!.docs[index]
//                           .data() as Map<String, dynamic>;
//                       return ListTile(
//                         title: Text("${data["fname"]}"),
//                         subtitle: Text("${data["score"]}"),
//                       );
//                     },
//                   ),
//                 );
//               }

//               return Text("No data available");
//             },
//           ),
//           SizedBox(
//             width: 200,
//             height: 100,
//             child: Text(
//               "dddd",
//               style: TextStyle(fontSize: 24),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class display1 extends StatefulWidget {
//   final String? scannedData;

//   const display1({Key? key, required this.scannedData}) : super(key: key);

//   @override
//   _display1State createState() => _display1State();
// }

// class _display1State extends State<display1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scanned Data'),
//       ),
//       body: Center(
//         child: Text(
//           widget.scannedData ?? 'No data scanned',
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );

//   }
// }
// class display1 extends StatefulWidget {
//   final String? scannedData;

//   const display1({Key? key, required this.scannedData}) : super(key: key);

//   @override
//   _display1State createState() => _display1State();
// }

// class _display1State extends State<display1> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.scannedData == null) {
//       return const MyHomePage();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scanned Data'),
//       ),
//       body: Center(
//         child: Text(
//           widget.scannedData!,
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );
//   }
// }
// class ResultPage extends StatefulWidget {
//   final String? scannedData;

//   const ResultPage({Key? key, required this.scannedData}) : super(key: key);

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   final String _textToCompare = '22223'; // เพิ่มตัวเก็บข้อความ 22223

//   @override
//   Widget build(BuildContext context) {
//     // เพิ่มเงื่อนไขเปรียบเทียบค่า widget.result กับ _textToCompare
//     if (widget.scannedData == _textToCompare) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Result'),
//         ),
//         body: Center(
//           child: Text('11112'), // แสดงผล "11112"
//         ),
//       );
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Result'),
//       ),
//       body: Center(
//         child: Text(widget.scannedData!),
//       ),
//     );
//   }
// }
// class display1 extends StatefulWidget {
//   final String? scannedData;

//   const display1({Key? key, required this.scannedData}) : super(key: key);

//   @override
//   _display1State createState() => _display1State();
// }

// class _display1State extends State<display1> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     if (widget.scannedData == null) {
//       return const MyHomePage();
//     }

//     return FutureBuilder<DocumentSnapshot>(
//       future: _firestore.collection('score').doc(widget.scannedData!).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasData && snapshot.data!.exists) {
//             // The scannedData exists in the 'score' collection.
//             // Do something here.
//             return Scaffold(
//               appBar: AppBar(
//                 title: const Text('Scanned Data'),
//               ),
//               body: Center(
//                 child: Text(
//                   widget.scannedData!,
//                   style: const TextStyle(fontSize: 24.0),
//                 ),
//               ),
//             );
//           } else {
//             // The scannedData doesn't exist in the 'score' collection.
//             // Do something here.
//             return Scaffold(
//               appBar: AppBar(
//                 title: const Text('Scanned Data'),
//               ),
//               body: Center(
//                 child: Text(
//                   'ไม่พบข้อมูล',
//                   style: const TextStyle(fontSize: 24.0),
//                 ),
//               ),
//             );
//           }
//         } else {
//           // The Future is not yet complete, show a loading spinner.
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
