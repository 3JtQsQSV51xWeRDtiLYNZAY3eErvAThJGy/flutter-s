import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '/model/student.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("students");
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("แบบฟอร์มบันทึกคะแนนสอบ"),
              ),
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          "ชื่อ",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          onSaved: (String? fname) {
                            myStudent.fname = fname;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "รหัสเครื่อง",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          onSaved: (String? score) {
                            myStudent.score = score;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              await _studentCollection.add({
                                "fname": myStudent.fname,
                                "score": myStudent.score
                              });
                              formKey.currentState!.reset();
                            }
                          },
                          child: Text('บันทึกข้อมูล'),
                        )
                      ],
                    )),
              ),
            );
          }
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}



// class display2 extends StatefulWidget {
//   final String? scannedData;

//   const display2({Key? key, required this.scannedData}) : super(key: key);

//   @override
//   _display2State createState() => _display2State();
// }

// class _display2State extends State<display2> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     if (widget.scannedData == null) {
//       return const MyHomePage();
//     }

//     return FutureBuilder<DocumentSnapshot>(
//       future: _firestore.collection('number').doc().get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasData && snapshot.data!.exists) {
//             // The scannedData exists in the 'score' collection.
//             // Check if it matches widget.scannedData.
//             if ((snapshot.data!.data() as Map<String, dynamic>)['22223']
//                     .toString() ==
//                 widget.scannedData) {
//               // The scannedData in the 'score' collection matches widget.scannedData.
//               return Scaffold(
//                 appBar: AppBar(
//                   title: const Text('Scanned Data'),
//                 ),
//                 body: Center(
//                   child: Text(
//                     'success',
//                     style: const TextStyle(fontSize: 24.0),
//                   ),
//                 ),
//               );
//             } else {
//               // The scannedData in the 'score' collection doesn't match widget.scannedData.
//               return Scaffold(
//                 appBar: AppBar(
//                   title: const Text('Scanned Data'),
//                 ),
//                 body: Center(
//                   child: Text(
//                     'ไม่พบข้อมูล',
//                     style: const TextStyle(fontSize: 24.0),
//                   ),
//                 ),
//               );
//             }
//           } else {
//             // The scannedData doesn't exist in the 'score' collection.
//             return Scaffold(
//               appBar: AppBar(
//                 title: const Text('Scanned Data'),
//               ),
//               body: Center(
//                 child: Text(
//                   widget.scannedData.toString(),
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

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Display2 extends StatefulWidget {
//   final String? scannedData;

//   const Display2({Key? key, required this.scannedData}) : super(key: key);

//   @override
//   _Display2State createState() => _Display2State();
// }

// class _Display2State extends State<Display2> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('students').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(
//               child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
//             ),
//           );
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         bool success = false;

//         // ignore: avoid_function_literals_in_foreach_calls
//         snapshot.data?.docs.forEach((document) {
//           final String? number01 = document['score']?.toString();

//           if (number01 == widget.scannedData) {
//             success = true;
//           }
//         });

//         if (success) {
//           return Scaffold(
//             body: Center(
//               child: Text('success'),
//             ),
//           );
//         } else {
//           return Scaffold(
//             body: Center(
//               child: Text('ไม่พบข้อมูล'),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Display2 extends StatefulWidget {
//   final String? scannedData;

//   const Display2({Key? key, required this.scannedData}) : super(key: key);

//   @override
//   _Display2State createState() => _Display2State();
// }

// class _Display2State extends State<Display2> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('students').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(
//               child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
//             ),
//           );
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         List<String> scores = [];

//         snapshot.data?.docs.forEach((document) {
//           final String? number01 = document['score']?.toString();

//           if (number01 == widget.scannedData) {
//             scores.add(document.id);
//           }
//         });

//         if (scores.isNotEmpty) {
//           return Scaffold(
//             body: Center(
//               child: Text('success, ${scores.join(", ")}'),
//             ),
//           );
//         } else {
//           return Scaffold(
//             body: Center(
//               child: Text('ไม่พบข้อมูล'),
//             ),
//           );
//         }
//       },
//     );
//   }
// }