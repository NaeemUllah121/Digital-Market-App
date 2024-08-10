import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utill/constants/color_manager.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor:  ColorsManager.red,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back,color:  ColorsManager.white,), onPressed: () { Get.back(); },
      //   ),
      //   title: const Text(
      //     'Terms & Conditions',
      //     style: TextStyle(
      //       fontSize: 18,
      //       color:  ColorsManager.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/meeting.png'),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Digital Market',
                        style: TextStyle(
                          fontSize: 24,
                          color:  ColorsManager.higherBlue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat', // Use a professional font
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Version 1.0.0',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Children's Literature Festival (CLF) is now rebranded as the Pakistan Learning Festival (PLF). It offers multi-disciplinary, multi-lingual learning strands for children (3-18), teachers, and college/university students. PLF is a movement to promote social capital and unlock the power of learning, reading, self-expression, and critical thinking.",
                        textAlign: TextAlign.justify,
                        // Adjust text alignment
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:  ColorsManager.higherBlue,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text('Continue'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Learn More',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
