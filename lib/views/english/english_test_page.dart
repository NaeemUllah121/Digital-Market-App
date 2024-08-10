// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:digital_market/controllers/english_question_controller.dart';
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/utill/constants/string_manager.dart';
import 'package:digital_market/views/english/widgets/listViewContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../store/local_store.dart';

class EnglishTestPage extends GetView<EnglishQuestionController> {
  @override
  final EnglishQuestionController controller =
      Get.put(EnglishQuestionController());

  EnglishTestPage({super.key});

  bool showInstructions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backGroundLightGreen,
      body: Obx(() {
        return LoadingOverlay(
          opacity: 0.3,
          progressIndicator: const CircularProgressIndicator(),
          isLoading: controller.isLoading.value,
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/green_background.png"),
                          fit: BoxFit.fill)),
                ),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              decoration: BoxDecoration(
                                color:  ColorsManager.white,
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
                                 StringManager.englishString,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: ColorsManager.vibrantYellow,
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
                      ],
                    ),
                    Column(
                      children: [
                        ListViewWidget(
                          wordList: controller.question,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: ColorsManager.vibrantYellow,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                // showCustomBottomSheet( controller.instructions.toString());
                                // showInstructions =
                                //     controller.showInstructions.toggle().value;
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 6.0,
                                  bottom: 6.0,
                                  left: 6.0,
                                  right: 6.0,
                                ),
                                child: Icon(Icons.help_outline),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                title: "GeeksforGeeks",
                                middleText: "Hello world!",
                                backgroundColor: ColorsManager.darkGreen,
                                titleStyle:
                                    const TextStyle(color: ColorsManager.white),
                                middleTextStyle:
                                    const TextStyle(color: ColorsManager.white),
                                // textConfirm: "Confirm",
                                // textCancel: "Cancel",
                                cancelTextColor:  ColorsManager.white,
                                confirmTextColor:  ColorsManager.white,
                                buttonColor: Colors.red,
                                barrierDismissible: false,
                                radius: 10,
                                actions: [
                                  Center(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 25),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: ColorsManager.vibrantGreen,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            child: const Text("Cancel"),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 25),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              String arguments =
                                                  await LocalStore
                                                      .getSampleAndCategoryId();
                                              List<String> argumentParts =
                                                  arguments.split(',');
                                              String sampleId =
                                                  argumentParts[0];
                                              int CategoryId =
                                                  int.parse(argumentParts[1]);
                                              CategoryId++;
                                              await LocalStore
                                                  .setSampleAndCategoryId(
                                                      "$sampleId,${CategoryId.toString()}");
                                              await controller.getQuestion(
                                                  sampleId,
                                                  CategoryId.toString());
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: ColorsManager.vibrantGreen,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            child: const Text("Confirm"),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                                content: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Is Child has Passed this Test",
                                      style: TextStyle(color:  ColorsManager.white),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ));
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.only(bottom: 10, right: 15.0),
                            child: Container(
                              height: 45,
                              width: 150,
                              decoration: BoxDecoration(
                                color:  ColorsManager.white,
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
                        ),
                      ],
                    ),
                    // Visibility(
                    //   visible: controller.showInstructions.value,
                    //   child: Container(
                    //     margin:
                    //         const EdgeInsets.only(left: 30, right: 30, top: 25),
                    //     child: Align(
                    //       alignment: Alignment.bottomCenter,
                    //       child: Text(
                    //         controller.instructions.toString(),
                    //         style: const TextStyle(fontSize: 18),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )

              ],
            ),
          ),
        );
      }),
    );
  }
}
