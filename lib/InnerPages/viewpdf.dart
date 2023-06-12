// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
// class ViewPdf extends StatefulWidget {
//   const ViewPdf({Key? key}) : super(key: key);

//   @override
//   _ViewPdfState createState() => _ViewPdfState();
// }

// class _ViewPdfState extends State<ViewPdf> {
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;

//   Future<void> listExample() async {
//     firebase_storage.ListResult result = await firebase_storage
//         .FirebaseStorage.instance
//         .ref()
//         .child('files')
//         .listAll();

//     result.items.forEach((firebase_storage.Reference ref) {
//       print('Found file: $ref');
//     });

//     result.prefixes.forEach((firebase_storage.Reference ref) {
//       print('Found directory: $ref');
//     });
//   }

//   Future<void> downloadURLExample() async {
//     String downloadURL = await firebase_storage.FirebaseStorage.instance
//         .ref('files/some-file.pdf')
//         .getDownloadURL();
//     print(downloadURL);
//     PdfView doc = await PDFDocument.fromURL(downloadURL);
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 ViewPDF(doc))); //Notice the Push Route once this is done.
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     listExample();
//     downloadURLExample();
//     print("All done!");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CircularProgressIndicator();
//   }
// }
// class ViewPdfs extends StatelessWidget {
//    PDFDocument document;  
//   ViewPDF(this.document); 
//   @override
//   Widget build(BuildContext context) {
//     return  PDFViewer(document: document);  
//   }
// }