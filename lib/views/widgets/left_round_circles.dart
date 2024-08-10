import 'package:flutter/material.dart';
import '../../utill/constants/color_manager.dart';

class LeftRoundCircles extends StatelessWidget {
  final String title;
  final Color? backGrouncolor;

  const LeftRoundCircles({
    Key? key,
    required this.title,
    required this.backGrouncolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10.0, left: 10.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                    color: backGrouncolor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: backGrouncolor!.withOpacity(0.9),
                          spreadRadius: 2,
                          // blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color:  ColorsManager.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 33,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:  ColorsManager.white,
                    border: Border.all(color: Colors.black)),
                child: CircleAvatar(
                  backgroundColor:  ColorsManager.white, // Change this to set the circle color
                  radius: 17,
                  child: Text(
                    '1',
                    style: TextStyle(color: backGrouncolor),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 22,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:  ColorsManager.white,
                    border: Border.all(color: Colors.black)),
                child: CircleAvatar(
                  backgroundColor:  ColorsManager.white, // Change this to set the circle color
                  radius: 17,
                  child: Text(
                    '2',
                    style: TextStyle(color: backGrouncolor),
                  ), // Text for the circle
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 3,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:  ColorsManager.white,
                    border: Border.all(color: Colors.black)),
                child: CircleAvatar(
                  backgroundColor:  ColorsManager.white, // Change this to set the circle color
                  radius: 17,
                  child: Text(
                    '3',
                    style: TextStyle(color: backGrouncolor),
                  ), // Text for the circle
                ),
              ),
            ),
          ],
        ));
  }
}
