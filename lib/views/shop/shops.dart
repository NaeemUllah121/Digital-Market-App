// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_market/views/Home/home_navbar.dart';
import 'package:digital_market/views/register/register_screen.dart';
import 'package:digital_market/views/shop/itemCard.dart';
import 'package:digital_market/views/terms_and_conditions/terms_and_conditions.dart';
import 'package:digital_market/views/widgets/RoundedAppBar.dart';
import 'package:digital_market/views/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controllers/shop_controller.dart';
import '../../items/shop_item.dart';
import '../../utill/constants/color_manager.dart';

class ShopPage extends GetView<ShopController> {
  @override
  ShopController controller = Get.put(ShopController());

  final backgroundColors = [
    ColorsManager.vibrantGreen,
    ColorsManager.vibrantPeach,
    ColorsManager.vibrantBlue,
    ColorsManager.vibrantYellow,
  ];

String title;
  ShopPage({super.key,required this.title});

   

  @override
  Widget build(BuildContext context) {
    String? selectedProvince = Get.arguments as String?;
    controller.getShops(selectedProvince);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.red,
        leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: ColorsManager.white,
            ),title: const Center(child: Text('Shops',style: TextStyle(color: ColorsManager.white),)),
            actions: [
              SizedBox(
                // margin: const EdgeInsets.only(left: 10.0),
                height: 28.h,
                width: 28.w,
                child:    const  Icon(
                  Icons.search,
                  color:  ColorsManager.white,
                  size: 32,
                )

              ),
              Container(
                height: 33.h,
                width: 35.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.red,
                    width: 3.0,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 12.w,
              // ),
            ]),
    
      // backgroundColor:  ColorsManager.buttonColr,
      // bottomNavigationBar: BottomNavBar(
      //   onTap: (index) {
      //     switch (index) {
      //       case 0:
      //         Get.offAll(() => const HomeNavbar());
      //         break;
      //       case 1:
      //         Get.offAll(() => const HomeNavbar());
      //         break;
      //       case 2:
      //         Get.offAll(() => const HomeNavbar());
      //         break;
      //       case 3:
      //         Get.offAll(() => const HomeNavbar());
      //         break;
      //       case 4:
      //         Get.offAll(() => const HomeNavbar());
      //         break;
      //     }
      //   },
      // ),
      body: Obx(() {
        return LoadingOverlay(
          opacity: 0.3,
          progressIndicator: const CircularProgressIndicator(),
          isLoading: controller.isLoading.value,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: ColorsManager.backgroundColr),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                // const RoundedAppBar(
                                //   title: 'Shops',
                                // ),
                                SizedBox(height: 10,),
                                                                   SizedBox(child: Text(title,style: TextStyle(color: ColorsManager.red,fontWeight: FontWeight.w900,fontSize: 20),)),

                                controller.eventList.isNotEmpty
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                1.8, // Adjust this value
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: controller.eventList.isNotEmpty
                                            ? CarouselSlider.builder(
                                                itemCount:
                                                    controller.eventList.length,
                                                options: CarouselOptions(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.2,
                                                  autoPlay: true,
                                                  enlargeCenterPage: true,
                                                  viewportFraction: 0.9,
                                                  autoPlayInterval:
                                                      const Duration(
                                                          seconds: 5),
                                                  autoPlayCurve:
                                                      Curves.fastOutSlowIn,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index,
                                                        int realIndex) {
                                                  final homeTopBanner =
                                                      controller
                                                          .eventList[index];
                                                  return ShopItem(
                                                    imageUrl:
                                                        homeTopBanner.url ?? "",
                                                    title: homeTopBanner.name ??
                                                        "",
                                                    // Adjust this value
                                                    placeholder:
                                                        homeTopBanner.name ??
                                                            "",
                                                    onTap: () {},
                                                  );
                                                },
                                              )
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: ColorsManager.vibrantBlue),
                                              ),
                                      )
                                    : const Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.sentiment_dissatisfied,
                                              size: 50,
                                              color: ColorsManager.vibrantBlue,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Waiting",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: ColorsManager.vibrantBlue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                       
                                // Container(
                                //   margin: const EdgeInsets.only(
                                //     left: 15.0,
                                //     right: 15.0,
                                //     bottom: 30.0,
                                //   ),
                                //   width: double.infinity,
                                //   height: 80,
                                //   child: controller.eventList.isNotEmpty
                                //       ? ClipRRect(
                                //           borderRadius:
                                //               BorderRadius.circular(10),
                                //           child: Image.asset(
                                //             "assets/images/add_shop_promo.png",
                                //             fit: BoxFit.fill,
                                //           ),
                                //         )
                                //       : const Center(
                                //           child: Column(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.center,
                                //             children: [
                                //               Icon(
                                //                 Icons.sentiment_dissatisfied,
                                //                 size: 50,
                                //                 color: ColorsManager.vibrantBlue,
                                //               ),
                                //               SizedBox(height: 10),
                                //               Text(
                                //                 "No image found",
                                //                 style: TextStyle(
                                //                   fontSize: 18,
                                //                   fontWeight: FontWeight.bold,
                                //                   color: ColorsManager.vibrantBlue,
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                // ),
                               
                                Container(
                                  color: Colors.transparent,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: SizedBox(
                                      height: Get.height * 0.9,
                                      child: controller.eventList.isNotEmpty
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: GridView.builder(
                                                    primary: false,
                                                    itemCount: controller
                                                        .eventList.length,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 10,
                                                      crossAxisCount: 2,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return itemsCard(
                                                        context: context,
                                                        img: controller
                                                            .eventList[index]
                                                            .url,
                                                        itemName: controller
                                                            .eventList[index]
                                                            .name,
                                                        itemPrice: controller
                                                            .eventList[index]
                                                            .name,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .sentiment_dissatisfied,
                                                    size: 50,
                                                    color: ColorsManager.vibrantBlue,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "Waiting",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorsManager.vibrantBlue,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
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
      }),
    );
  }
}
