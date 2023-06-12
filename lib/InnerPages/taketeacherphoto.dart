import 'dart:io';
import 'package:collageadminnew/InnerPages/retriveimagefromdb.dart';
import 'package:collageadminnew/services.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class TakeTeacherPhoto extends StatefulWidget {
  const TakeTeacherPhoto({Key? key}) : super(key: key);

  @override
  _TakeTeacherPhotoState createState() => _TakeTeacherPhotoState();
}

class _TakeTeacherPhotoState extends State<TakeTeacherPhoto> {
  File? file;
  UploadTask? task;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);
    });
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = 'image/$fileName';
    task = MyFirebaseStorage.uploadFile(destination, file!);
    setState(() {});
    if (task == null) return;
    final snaptshot = await task!.whenComplete(() => {});
    final url = await snaptshot.ref.getDownloadURL();
    print(url);
  }

  Widget UploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final uploadPercent = (progress * 100).toStringAsFixed(2);
            return Text("$uploadPercent % Uploaded Successfully");
          } else {
            return Container();
          }
        },
      );
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No Photo Selected';
    return Scaffold(
      appBar: AppBar(title: Text("Upload Teacher Photo")),
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 90,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/select.png',
                                height: 100,
                              ),
                              Text(
                                'Select Photo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 0.75,
                      width: MediaQuery.of(context).size.width - 30.0,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    task != null ? UploadStatus(task!) : Container(),
                    SizedBox(height: 15),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                selectFile();
                              },
                              child: Text('select Photo'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                uploadFile();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    content:
                                        Text("Image Uploaded Successfully"),
                                  ),
                                );
                              },
                              child: Text('Upload Photo'),
                            ),
                            SizedBox(width: 10),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 RetrivingImageFromDb()));
                            //   },
                            //   child: Text('View Images'),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      fileName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    file != null
                        ? Image.file(
                            file!,
                            width: 300,
                            height: 270,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'images/noimg.jpg',
                            width: 300,
                            height: 270,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
