import "package:flutter/material.dart";
import "package:hexcolor/hexcolor.dart";
import 'package:golearnlish/screens/quiz/quiz.dart';
import 'package:golearnlish/screens/quiz/result.dart';

class MainQuiz extends StatefulWidget {
  const MainQuiz({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainQuizState();
  }
}

class _MainQuizState extends State<MainQuiz> {
  static const _data = [
    {
      'questionText': 'the verb 2 of go is?',
      'answers': [
        {'text': 'went', 'score': 10.00},
        {'text': 'gone', 'score': 4.61},
        {'text': 'goes', 'score': 1.95},
        {'text': 'None of the above', 'score': 0.00},
      ]
    },
    {
      'questionText': 'they didnt do anything',
      'answers': [
        {'text': 'when', 'score': 2.3},
        {'text': 'future', 'score': 0.32},
        {'text': 'present', 'score': 3.00},
        {'text': 'past', 'score': 10.00},
      ]
    },
    {
      'questionText':
          'if they ____ informed us about the test, we would get a better score',
      'answers': [
        {'text': 'dont', 'score': 0.64},
        {'text': 'had', 'score': 10.00},
        {'text': 'will', 'score': 3.28},
        {'text': 'some', 'score': 1.02}
      ]
    },
    {
      'questionText': 'andy bought not only a new car, but also',
      'answers': [
        {'text': 'old house', 'score': 0.12},
        {'text': 'fish', 'score': 2.13},
        {'text': 'people', 'score': 6.42},
        {'text': 'new house', 'score': 10.00}
      ]
    },
    {
      'questionText': 'Bats ___ find their prey in the darkness',
      'answers': [
        {'text': 'fly', 'score': 5.53},
        {'text': 'can', 'score': 10.00},
        {'text': 'could', 'score': 2.47},
        {'text': 'would', 'score': 2.35}
      ]
    }
  ];

  var _indexQuestion = 0;
  double _totalScore = 0.00;

  void _answerQuestion(double score) {
    _totalScore += score;

    setState(() {
      _indexQuestion += 1;
    });
  }

  void _restart() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Quiz',
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
          body: Align(
              alignment: Alignment.center,
              child: (_indexQuestion <= 4 && _indexQuestion >= 0)
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      indexQuestion: _indexQuestion,
                      data: _data)
                  : Result(_totalScore, _restart))),
    );
  }
}
