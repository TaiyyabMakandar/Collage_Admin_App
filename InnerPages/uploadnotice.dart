import 'dart:io';
import 'package:collageadminnew/InnerPages/viewnoticepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:coladmin/alldata.dart';

class UploadNotice extends StatefulWidget {
  const UploadNotice({Key? key}) : super(key: key);

  @override
  State<UploadNotice> createState() => _UploadNoticeState();
}

class _UploadNoticeState extends State<UploadNotice> {
  late TextEditingController _notice1;

  late DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notice1 = TextEditingController();
    //  _notice2 = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Uploaded Notice');
  }

  final databaseRef =
      FirebaseDatabase.instance.reference().child('Uploaded Notice');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Notice")),
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
                      onTap: () {
                        // _showDeleteDialog(data: data);
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
                                'images/calendar.png',
                                height: 100,
                              ),
                              Text(
                                'Upload Notice',
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

                    TextFormField(
                      controller: _notice1,
                      keyboardType: TextInputType.name,
                      decoration: new InputDecoration(
                        hintText: 'Enter your Notice ',
                        border: OutlineInputBorder(),
                        labelText: 'Enter your Notice',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    // TextFormField(
                    //   controller: _notice2,
                    //   keyboardType: TextInputType.name,
                    //   decoration: new InputDecoration(
                    //     hintText: 'Second Notice',
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Enter your Second Notice',
                    //     labelStyle: TextStyle(color: Colors.black),
                    //     icon: Icon(Icons.calendar_month_outlined),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   obscureText: true,
                    //   decoration: new InputDecoration(
                    //     hintText: 'Password',
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Enter your Password',
                    //     labelStyle: TextStyle(color: Colors.black),
                    //     icon: Icon(Icons.phone),
                    //   ),
                    // ),

                    SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String notice1 = _notice1.text;
                        // String notice2 = _notice2.text;

                        Map<String, String> data = {
                          'notice1': notice1,
                          //   'notice2': notice2,
                        };
                        _ref.push().set(data);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            content: Text("Notice Uploaded Successfully"),
                          ),
                        );
                      },
                      child: Text('Upload'),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     SizedBox(
                    //       width: 130,
                    //       height: 44,
                    //       child: FlatButton(
                    //         color: Colors.green,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(30),
                    //         ),
                    //         child: Text(
                    //           'Send',
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //         onPressed: () async {
                    //           String notice1 = _notice1.text;
                    //           // String notice2 = _notice2.text;

                    //           Map<String, String> data = {
                    //             'notice1': notice1,
                    //             //   'notice2': notice2,
                    //           };
                    //           _ref.push().set(data);
                    //         },
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 25,
                    //     ),
                    //     // SizedBox(
                    //     //   width: 130,
                    //     //   height: 44,
                    //     //   child: FlatButton(
                    //     //       color: Colors.green,
                    //     //       shape: RoundedRectangleBorder(
                    //     //         borderRadius: BorderRadius.circular(30),
                    //     //       ),
                    //     //       child: Text(
                    //     //         'View Notice',
                    //     //         style: TextStyle(color: Colors.black),
                    //     //       ),
                    //     //       onPressed: () {
                    //     //         Navigator.push(
                    //     //             context,
                    //     //             MaterialPageRoute(
                    //     //                 builder: (context) =>
                    //     //                     ViewNoticePage()));
                    //     //       }),
                    //     // ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

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
    //                 reference
    //                     .child(data['key'])
    //                     .remove()
    //                     .whenComplete(() => Navigator.pop(context));
    //               },
    //               child: Text('Delete')),
    //         ],
    //       );
    //     },
    //   );
    //}
  }
}















//       body: ListView(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Container(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 90,
//                   ),
//                   Material(
//                     elevation: 10.0,
//                     borderRadius: BorderRadius.circular(15.0),
//                     child: Container(
//                       height: 590,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(7.0),
//                       ),
//                       child: Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: Column(
//                             children: <Widget>[
//                               CircleAvatar(
//                                 radius: 70,
//                                 backgroundImage: AssetImage('images/man.png'),
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               TextFormField(
//                                 controller: _notice1,
//                                 keyboardType: TextInputType.name,
//                                 decoration: new InputDecoration(
//                                   hintText: 'User Name',
//                                   border: OutlineInputBorder(),
//                                   labelText: 'Enter your Name',
//                                   labelStyle: TextStyle(color: Colors.black),
//                                   icon: Icon(Icons.person),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),

//                               TextFormField(
//                                 controller: _notice2,
//                                 keyboardType: TextInputType.emailAddress,
//                                 decoration: new InputDecoration(
//                                   hintText: 'Email',
//                                   border: OutlineInputBorder(),
//                                   labelText: 'Enter your Email',
//                                   labelStyle: TextStyle(color: Colors.black),
//                                   icon: Icon(Icons.email),
//                                 ),
//                               ),
//                               // SizedBox(
//                               //   height: 15,
//                               // ),
//                               // TextFormField(
//                               //   keyboardType: TextInputType.number,
//                               //   obscureText: true,
//                               //   decoration: new InputDecoration(
//                               //     hintText: 'Password',
//                               //     border: OutlineInputBorder(),
//                               //     labelText: 'Enter your Password',
//                               //     labelStyle: TextStyle(color: Colors.black),
//                               //     icon: Icon(Icons.phone),
//                               //   ),
//                               // ),

//                               SizedBox(
//                                 height: 25,
//                               ),
//                               FlatButton(
//                                 color: Colors.green,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: Text(
//                                   'Add Teacher',
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                                 onPressed: () async {
//                                   String notice1 = _notice1.text;
//                                   String notice2 = _notice2.text;

//                                   Map<String, String> data = {
//                                     'notice1': notice1,
//                                     'notice2': notice2,
//                                   };
//                                   _ref.push().set(data);
//                                 },
//                               ),
//                             ],
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }