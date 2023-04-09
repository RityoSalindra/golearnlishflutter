// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:golearnlish/videocard.dart';

class belajar extends StatefulWidget {
  const belajar({super.key});

  @override
  State<belajar> createState() => _belajarState();
}

class _belajarState extends State<belajar> {
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
        backgroundColor: Color(0xFFE0E6F3),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            CardCourses(
              image: Image.asset("lib/assets/images/video.jpg",
                  width: 40, height: 40),
              color: Color(0xFFFAE4F4),
              title: "Adobe XD Prototyping",
              hours: "10 hours, 19 lessons",
              progress: "25%",
              percentage: 0.25,
            ),
            CardCourses(
              image: Image.asset("lib/assets/images/video.jpg",
                  width: 40, height: 40),
              color: Color(0xFFFFF5E5),
              title: "Sketch shortcuts and tricks",
              hours: "10 hours, 19 lessons",
              progress: "50%",
              percentage: 0.5,
            ),
            CardCourses(
              image: Image.asset("lib/assets/images/video.jpg",
                  width: 40, height: 40),
              color: Color(0xFFFBF5FF),
              title: "UI Motion Design in After Effects",
              hours: "10 hours, 19 lessons",
              progress: "75%",
              percentage: 0.75,
            ),
          ],
        ),
      ),
    );
  }
}
