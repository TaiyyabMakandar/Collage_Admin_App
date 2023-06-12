// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class allData extends StatefulWidget {
//   const allData({Key? key}) : super(key: key);

//   @override
//   _allDataState createState() => _allDataState();
// }

// class _allDataState extends State<allData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('test').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return Text('No value');
//         }
//         return ListView(
//           children: snapshot.data.documents.map((document) {
//             return Text(document['field1']);
//           }).toList(),
//         );
//       },
//     ),

//     );
//   }
// }
