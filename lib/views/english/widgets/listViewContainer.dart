// ignore_for_file: file_names

import 'package:digital_market/controllers/english_question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewWidget extends StatelessWidget {
  final RxList<String> wordList;

  const ListViewWidget({super.key, required this.wordList});

  @override
  Widget build(BuildContext context) {
    return GetX<EnglishQuestionController>(
      builder: (controller){
        String categoryName = controller.categoryName.value;
    if (categoryName == "sentence-level") {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
          child: Column(
            children: wordList.expand((sentence) {
              List<String> sentences = sentence.split('.');
              return sentences.map((splitSentence) {
                return Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      splitSentence,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ),
      );
    } else {
      List<Widget> rows = [];
      int index = 0;
      bool isOddRow = true;
      while (index < wordList.length) {
        List<Widget> items = [];
        if (isOddRow) {
          for (int i = index; i < index + 3 && i < wordList.length; i++) {
            items.add(Container(
              margin: const EdgeInsets.only(top: 15.0, bottom: 20.0),
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
              margin: const EdgeInsets.only(top: 15.0, bottom: 20.0),
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
          padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
          child: Column(
            children: rows,
          ),
        ),
      );
    }
      },
    );
  }
}
