import 'package:aser_application/utill/Colors.dart';
import 'package:aser_application/utill/constants.dart';
import 'package:flutter/material.dart';
import 'package:aser_application/screens/english/widgets/listViewContainer.dart';

class EnglishTestPage extends StatefulWidget {
  const EnglishTestPage({Key? key}) : super(key: key);

  @override
  State<EnglishTestPage> createState() => _EnglishTestPageState();
}
class _EnglishTestPageState extends State<EnglishTestPage> {
  List<String> wordslist = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Imbe',
    'Jackfruit',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundLightGreen,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 140,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 10,
              right: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 60.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 6.0,
                          bottom: 6.0,
                          left: 12.0,
                          right: 12.0,
                        ),
                        child: Text(
                          englishString,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        color: vibrantYellow,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          'Centered Text',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 130,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    ListViewWidget(
                      wordList: wordslist,
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 140,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 110,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: vibrantYellow,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 6.0,
                              bottom: 6.0,
                              left: 6.0,
                              right: 6.0,
                            ),
                            child: Icon(
                              Icons.help_outline
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10,right: 15.0),
                        child: Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                            child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
