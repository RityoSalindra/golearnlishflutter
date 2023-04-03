import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Text(
        "Profil Page",
        style: TextStyle(fontSize: 24),
      ))),
    );
  }
}
