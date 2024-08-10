// ignore_for_file: must_be_immutable
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_market/controllers/cities.dart';
import 'package:digital_market/views/city/widgets/itemCard.dart';
import 'package:digital_market/views/widgets/RoundedAppBar.dart';
import 'package:digital_market/views/widgets/item_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../utill/constants/color_manager.dart';
import '../Home/home_navbar.dart';
import '../widgets/bottom_nav.dart';

class CityPage extends GetView<CityController> {
  @override
  CityController controller = Get.put(CityController());

  final backgroundColors = [
   ColorsManager.vibrantGreen,
    ColorsManager.vibrantPeach,
    ColorsManager. vibrantBlue,
    ColorsManager.vibrantYellow,
  ];
  String title;

  CityPage({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    String? selectedProvince = Get.arguments as String?;
    controller.getCities(selectedProvince);
    return Scaffold(
      backgroundColor:  ColorsManager.buttonColr,
      appBar: AppBar(
        backgroundColor: ColorsManager.red,
        leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: ColorsManager.white,
            ),title: const Center(child: Text('Cities',style: TextStyle(color: ColorsManager.white),)),
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
            
              Align(
                alignment: Alignment.topRight,
                child: Container(
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
              ),
              // SizedBox(
              //   width: 12.w,
              // ),
            ]),
    
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
                        decoration: BoxDecoration(color:  ColorsManager.white),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                // const RoundedAppBar(title: 'City',),
                                const SizedBox(
                                    height: 10,
                                    ),
                                    SizedBox(child: Text(title,style: TextStyle(color: ColorsManager.red,fontWeight: FontWeight.w900,fontSize: 20),)),
                                controller.cityList.isNotEmpty
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                1.5, // Adjust this value
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: CarouselSlider.builder(
                                          itemCount:
                                              controller.cityList.length,
                                          options: CarouselOptions(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.9,
                                            // Adjust this value
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            autoPlayInterval:
                                                const Duration(seconds: 5),
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index, int realIndex) {
                                            final homeTopBanner =
                                                controller.cityList[index];
                                            return ItemSlider(
                                              imageUrl: homeTopBanner.bannerImage!,
                                              title: homeTopBanner.name!,
                                              // Adjust this value
                                              placeholder: homeTopBanner.name!,
                                              // Adjust this value
                                              onTap: () {
                                                // Handle tap on the slider item
                                              },
                                            );
                                          },
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
                                //   child: controller.cityList.isNotEmpty
                                //       ? ClipRRect(
                                //     borderRadius:
                                //     BorderRadius.circular(10),
                                //     child: Image.asset(
                                //       "assets/images/add_shop_promo.png",
                                //       fit: BoxFit.fill,
                                //     ),
                                //   )
                                //       : const Center(
                                //     child: Column(
                                //       mainAxisAlignment:
                                //       MainAxisAlignment.center,
                                //       children: [
                                //         Icon(
                                //           Icons.sentiment_dissatisfied,
                                //           size: 50,
                                //           color: ColorsManager.vibrantBlue,
                                //         ),
                                //         SizedBox(height: 10),
                                //         Text(
                                //           "No image found",
                                //           style: TextStyle(
                                //             fontSize: 18,
                                //             fontWeight: FontWeight.bold,
                                //             color: ColorsManager.vibrantBlue,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                
                                Container(
                                  color: Colors.transparent,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: SizedBox(
                                      height: Get.height * 0.9,
                                      child: controller.cityList.isNotEmpty
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: GridView.builder(
                                                    primary: false,
                                                    itemCount: controller
                                                        .cityList.length,
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
                                                            .cityList[index]
                                                            .url,
                                                        itemName: controller
                                                            .cityList[index]
                                                            .name,
                                                        itemPrice: controller
                                                            .cityList[index]
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
