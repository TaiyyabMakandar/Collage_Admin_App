// @dart=2.9

import 'package:collageadminnew/Activities/home.dart';
import 'package:collageadminnew/Activities/splachscreen.dart';
import 'package:collageadminnew/InnerPages/aboutme.dart';
import 'package:collageadminnew/InnerPages/deletenotice.dart';
import 'package:collageadminnew/InnerPages/teacherdata.dart';
import 'package:collageadminnew/InnerPages/uploadebook.dart';
import 'package:collageadminnew/InnerPages/uploadimage.dart';
import 'package:collageadminnew/InnerPages/uploadnotice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => splachScreen(),
        "/home": (context) => HomeScreen(),
        "/uploadnotice": (context) => UploadNotice(),
        "/uploadimage": (context) => UploadImage(),
        "/uploadebook": (context) => UploadEBook(),
        "/deletenotice": (context) => DeleteNotice(),
        "/teacherdata": (context) => TeacherData(),
        "/aboutus": (context) => Aboutus(),
      },
    );
  }
}
