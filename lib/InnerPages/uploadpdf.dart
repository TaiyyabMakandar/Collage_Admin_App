// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_document_picker/flutter_document_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class UploadPdf extends StatefulWidget {
//   const UploadPdf({Key? key}) : super(key: key);

//   @override
//   _UploadPdfState createState() => _UploadPdfState();
// }

// Future<firebase_storage.UploadTask> uploadFile(File file) async {
//   if(file == null){
//     print('no file was picked');
//     // return null;
//   }
//   firebase_storage.UploadTask uploadTask;

//   // create a refrence to the file

//   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//       .ref()
//       .child('files')
//       .child('/some-file.pdf');

//   final metaData = firebase_storage.SettableMetadata(
//       contentType: 'file/pdf', customMetadata: {'picked-file-path': file.path});

//   print("Uploading...!");
//   uploadTask = ref.putData(await file.readAsBytes(), metaData);

//   print("Done...!");
//   return Future.value(uploadTask);
// }

// class _UploadPdfState extends State<UploadPdf> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: RaisedButton(
//           child: Text('Select Pdf'),
//           onPressed: () async {
//             // for opening a document file in our mobile

//             final path = await FlutterDocumentPicker.openDocument();
//             print(path);
//             File file = File(path);
//             firebase_storage.UploadTask task = await uploadFile(file);
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
