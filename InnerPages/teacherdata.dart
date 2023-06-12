import 'package:collageadminnew/InnerPages/addteacher.dart';
import 'package:collageadminnew/InnerPages/taketeacherphoto.dart';
import 'package:collageadminnew/InnerPages/viewteacherdata.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class TeacherData extends StatefulWidget {
  const TeacherData({Key? key}) : super(key: key);

  @override
  State<TeacherData> createState() => _TeacherDataState();
}

class _TeacherDataState extends State<TeacherData> {
  late Query _ref;
  final databaseReference =
      FirebaseDatabase.instance.reference().child('Uploaded Notice');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Uploaded Notice');
    // .orderByChild('address');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Teacher Data")),
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
                                'images/folder.png',
                                height: 100,
                              ),
                              Text(
                                'Teacher Data',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewTeacherData()));
                            },
                            child: Text('Teacher Data'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TakeTeacherPhoto()));
                            },
                            child: Text('Take Photo'),
                          ),
                        ),
                      ],
                    )
                    // Expanded(child: FutureBuilder(future: loadImages(), builder: (context,AsyncSnapshot snapshot){
                    //   if(snapshot.connectionState == ConnectionState.waiting){
                    //     return Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   }
                    //   return ListView.builder(
                    //     itemCount: snapshot.data.length ?? 0,
                    //     itemBuilder: (context,index){
                    //       final Map image = snapshot.data[index];
                    //       return Column(
                    //         children: [
                    //           Expanded(child: Card(child: Container(height: 200,
                    //           child: Image.network(image['url']),),),),
                    //         ],);

                    //     });
                    // }),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTeacher()));
        },
        child: Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

// loadImages() {
// }
