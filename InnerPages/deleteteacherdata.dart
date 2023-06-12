import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class DeleteTeacherData extends StatefulWidget {
  const DeleteTeacherData({ Key? key }) : super(key: key);

  @override
  _DeleteTeacherDataState createState() => _DeleteTeacherDataState();
}

class _DeleteTeacherDataState extends State<DeleteTeacherData> {
  late Query _ref;
  final databaseReference =
      FirebaseDatabase.instance.reference().child('TeacherData');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('TeacherData');
    // .orderByChild('notice1');
  }

  // Widget _buildNoticeItem({Map contact}){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color.fromARGB(234, 223, 221, 221),
      appBar: AppBar(title: Text("Teacher Information")),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            Flexible(
              child: FirebaseAnimatedList(
                  query: _ref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 350,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(234, 223, 221, 221),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 10, right: 10, bottom: 10),
                              child: Column(children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Name:-",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot.value['name'],
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Email:-",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot.value['email'],
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Phone:-",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot.value['phone'],
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Address:-",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot.value['address'],
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // ListTile(
                        //   leading: Icon(
                        //     Icons.label_important,
                        //     color: Colors.black,
                        //   ),

                        //   title: Text(snapshot.value['email']),
                        //   // subtitle: Text(snapshot.value['notice2']),
                        // ),
                        Container(
                          width: double.infinity,
                          height: 0.75,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  }),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // databaseReference.child('notice1').remove();
                //databaseReference.child(Key).remove();
                FirebaseDatabase.instance
                    .reference()
                    .child('TeacherData')
                    // .child('notice1')
                    .remove();

ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            content: Text("Data Deleted Successfully"),
                          ),
                        );

               
              },
            ),
          ],
        ),
      ),
    );
  }
}