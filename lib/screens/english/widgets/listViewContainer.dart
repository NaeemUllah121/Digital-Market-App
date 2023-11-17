import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final List<String> wordList;

  ListViewWidget({required this.wordList});
  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    int index = 0;
    bool isOddRow = true;
    while (index < wordList.length) {
      List<Widget> items = [];
      if (isOddRow) {
        for (int i = index; i < index + 3 && i < wordList.length; i++) {
          items.add(Container(
            margin: const EdgeInsets.only(top: 30.0,bottom: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(wordList[i],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 23.0)),
            ),
          ));
        }
        isOddRow = false;
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ));
        index += 3;
      } else {
        for (int i = index; i < index + 2 && i < wordList.length; i++) {
          items.add(Container(
            margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(wordList[i],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 23.0)),
            ),
          ));
        }
        isOddRow = true;
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ));
        index += 2;
      }
    }
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 55.0, bottom: 10.0),
        child: Column(
          children: rows,
        ),
      ),
    );
  }
}
