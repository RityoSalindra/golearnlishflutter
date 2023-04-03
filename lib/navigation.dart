import 'package:flutter/material.dart';
import 'package:golearnlish/dasboard.dart';
import 'package:golearnlish/profile.dart';
import 'package:golearnlish/belajar.dart';
import 'package:golearnlish/quiz.dart';

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  PageController _pageController = PageController();
  int selectedPage = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [buildPageView(), buildBottomNav()]),
    );
  }

  Widget buildPageView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.93,
      child: PageView(
        controller: _pageController,
        children: [
          dasboard(),
          belajar(),
          quiz(),
          profile(),
        ],
        onPageChanged: (index) {
          onPageChange(index);
        },
      ),
    );
  }

  Widget buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: selectedPage,
      selectedItemColor: Colors.amber[800],
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Belajar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      onTap: (int index) {
        _pageController.animateToPage(index,
            duration: Duration(microseconds: 1000), curve: Curves.easeIn);
      },
    );
  }

  onPageChange(int index) {
    setState(() {
      selectedPage = index;
    });
  }
}
