// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:golearnlish/videocard.dart';
import 'package:golearnlish/screens/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class belajar extends StatefulWidget {
  const belajar({super.key});

  @override
  State<belajar> createState() => _belajarState();
}

class _belajarState extends State<belajar> {
  String? qrtext;
  Map<String, dynamic> data = {};
  final db =
      FirebaseFirestore.instance.collection("learn").doc('belajar').snapshots();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataQrText();
  }

  void getDataQrText() async {
    var dataQRText = await FirebaseFirestore.instance
        .collection('learn')
        .doc('belajar')
        .get();

    setState(() {
      qrtext = dataQRText.data()!['title'];
      //data = dataQRText.docs.map((doc) => doc.data()).toList();
    });
  }

  //FirebaseFirestore.instance.collection('golearn').doc('belajar').get().then((QuerySnapshot querySnapshot) {
//querySnapshot.docs.forEach((doc) {
//print(doc.data());
//});
//});

  List<Map<String, dynamic>> dataUtama = [
    {
      "title": "Simple past and present tense",
      "desc":
          "In this type of tenses, the events or events you are talking abovut will be in the present and validly acknowledged. But there will be various conditions that describe different information focuses. You can also pay attention to two Simple Present Tense sentence patterns with those that have verbs and those that don't have verbs:",
      "hours": "10 hours, 19 lessons",
      // "image":
      //     Image.asset("lib/assets/images/video.jpg", width: 40, height: 40),
      "progress": "25%",
    },
    {
      "title": "Learning general vocabulary",
      "desc":
          "In understanding English material for beginners, you will find some common vocabulary that people often use in their daily activities. Memorizing some new words is important so that you understand the essence of some simple conversations and two-way communication can work well.",
      "hours": "10 hours, 19 lessons",
      // "image":
      //     Image.asset("lib/assets/images/video.jpg", width: 40, height: 40),
      "progress": "50%",
    },
    {
      "title": "introduction of verb",
      "desc":
          "A verb that has a function as an action performed by the subject in a sentence. Written activities or activities can be in the form of movements or expressions that can be seen. Verb can be an action that appears abstractly (not clearly visible, readable only in thoughts or feelings).",
      "hours": "10 hours, 19 lessons",
      // "image":
      //     Image.asset("lib/assets/images/video.jpg", width: 40, height: 40),
      "progress": "75%",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Video',
          style: TextStyle(color: Color(0xFF1A1C24)),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: db,
          builder: (context, snapshot) {
            // Handle the snapshot data and return a Widget
            if (snapshot.hasData) {
              // Process the data and return a specific Widget
              return Text('Data received: ${snapshot.data}');
            } else if (snapshot.hasError) {
              // Handle the error and return an error Widget
              return Text('Error occurred: ${snapshot.error}');
            } else {
              // Return a default Widget or a progress indicator
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      backgroundColor: Color(0xFFF2F6FC),
    );
  }
}
