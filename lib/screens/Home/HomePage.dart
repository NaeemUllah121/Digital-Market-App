import 'package:aser_application/screens/english/EnglishTestPage.dart';
import 'package:aser_application/screens/widgets/left_round_circles.dart';
import 'package:aser_application/utill/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/nav2/get_information_parser.dart';
import '../../utill/Colors.dart';
import '../widgets/right_round_circles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Transform.rotate(
                      angle: 0.79,
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: higherBlue,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Transform.rotate(
                      angle: 0.79,
                      alignment: Alignment.bottomRight,
                      child: Container(
                        color: lightestBlue,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Form(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40.0, bottom: 10,),
                                  child: ClipRect(
                                    child: Center(
                                      child: Container(
                                          height: 100,
                                          child: Text(
                                            startTextString,
                                            style: TextStyle(fontWeight: FontWeight.w900,fontSize: 45.0,color: vibrantBlue),
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () => Get.offAll(const EnglishTestPage()),
                                  child: const RightRoundCircles(title: englishString,backGrouncolor:Color.fromARGB(
                                      255, 0, 150, 119)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const LeftRoundCircles(title: urduSindiString,backGrouncolor:Color.fromARGB(
                                    255, 242, 82, 107)),
                                const SizedBox(
                                  height: 10,
                                ),
                                const RightRoundCircles(title: mathString,backGrouncolor:Color.fromARGB(
                                    255, 3, 103, 176)),
                                const SizedBox(
                                  height: 10,
                                ),
                                const LeftRoundCircles(title: generalKnowledgeString,backGrouncolor:Color.fromARGB(
                                    255, 248, 153, 51)),
                                const SizedBox(
                                  height: 10,
                                ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
