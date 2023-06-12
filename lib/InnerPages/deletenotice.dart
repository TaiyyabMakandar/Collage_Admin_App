import 'package:collageadminnew/InnerPages/deleteteacherdata.dart';
import 'package:collageadminnew/InnerPages/deleteteacherphoto.dart';
import 'package:collageadminnew/InnerPages/retriveimagefromdb.dart';
import 'package:collageadminnew/InnerPages/viewnoticepage.dart';
import 'package:collageadminnew/InnerPages/viewteacherdata.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DeleteNotice extends StatefulWidget {
  const DeleteNotice({Key? key}) : super(key: key);

  @override
  State<DeleteNotice> createState() => _DeleteNoticeState();
}

class _DeleteNoticeState extends State<DeleteNotice> {
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('Uploaded Notice');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delete Page")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 130, left: 30, right: 30),
          child: Column(
            children: <Widget>[
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 2,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ViewNoticePage()));
                      },
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
                                'images/edit.png',
                                height: 100,
                              ),
                              Text(
                                'Delete Notice',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RetrivingImageFromDb()));
                      },
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
                                'images/image.png',
                                height: 100,
                              ),
                              Text(
                                'Delete Images',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                       Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DeleteTeacherPhotot()));
                      },
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
                                'images/deletephoto.png',
                                height: 100,
                              ),
                              Text(
                                'Delete Teacher Pic',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                         Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DeleteTeacherData()));
                      },
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
                                'images/delete.png',
                                height: 100,
                              ),
                              Text(
                                'Delete Teacher Data',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 70),
                child: Text(
                  "Which Data you want to delete Select It",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _showDeleteDialog({Map data}) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Delete ${data[['name']]}'),
  //         content: Text('Are you sure you want to delete?'),
  //         actions: [
  //           FlatButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text('Cancel')),
  //           FlatButton(
  //               onPressed: () {
  //                 reference.child(data['key']).remove().whenComplete(() => Navigator.pop(context));
  //               },
  //               child: Text('Delete')),
  //         ],
  //       );
  //     },
  //   );
  // }
}
