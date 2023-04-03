import 'package:flutter/material.dart';

class belajar extends StatelessWidget {
  // const belajar({super.key});

  final titles = ["Video 1", "Video 2", "Video 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];

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
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      title: Text(titles[index]),
                      subtitle: Text(subtitles[index]),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                      trailing: Icon(icons[index])));
            }),
      ),
    );
  }
}
