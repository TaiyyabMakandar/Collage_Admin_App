import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UploadEBook extends StatefulWidget {
  const UploadEBook({Key? key}) : super(key: key);

  @override
  State<UploadEBook> createState() => _UploadEBookState();
}

class _UploadEBookState extends State<UploadEBook> {

@override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Collage Website")),
      
      body: WebView(
        initialUrl:'https://www.w3schools.com/',
        
      )
    );
  }

}
