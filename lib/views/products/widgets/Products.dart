// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_market/controllers/products_controller.dart';
import 'package:digital_market/views/widgets/RoundedAppBar.dart';
import 'package:digital_market/views/widgets/item_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utill/constants/color_manager.dart';
import 'itemCard.dart';

class ProductsPage extends GetView<ProductsController> {
  @override
  final ProductsController controller = Get.put(ProductsController());

  final backgroundColors = [
    ColorsManager.vibrantGreen,
    ColorsManager.vibrantPeach,
    ColorsManager.vibrantBlue,
    ColorsManager.vibrantYellow,
  ];
String title;
  ProductsPage({super.key,required this.title});
 void _launchYoutubeUrl() async {
    final Uri url = Uri.parse('https://www.youtube.com/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    String? selectedShop = Get.arguments as String?;
    controller.getProducts(selectedShop);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.red,
        leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: ColorsManager.white,
            ),
            title: const Center(child: 
            Text('Products',style: TextStyle(color: ColorsManager.white),
            )),
            actions: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
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
                                // const RoundedAppBar(
                                //   title: 'Products',
                                // ),
                                SizedBox(height: 10,),
                                                                   SizedBox(child: Text(title,style: TextStyle(color: ColorsManager.red,fontWeight: FontWeight.w900,fontSize: 20),)),

                                const SizedBox(
                                  height: 10,
                                ),
                                controller.productList.isNotEmpty
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                1.7,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: controller.productList.isNotEmpty
                                            ? CarouselSlider.builder(
                                                itemCount: controller
                                                    .productList.length,
                                                options: CarouselOptions(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.9,
                                                  // Adjust this value
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
                                                          .productList[index];
                                                  return ItemSlider(
                                                    imageUrl: homeTopBanner
                                                        .bannerImage!,
                                                    title: homeTopBanner.name!,
                                                    // Adjust this value
                                                    placeholder:
                                                        homeTopBanner.name!,
                                                    // Adjust this value
                                                    onTap: () {
                                                      // Handle tap on the slider item
                                                    },
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
                                const SizedBox(
                                  height: 10,
                                ),

                                 Container(
                                        margin:EdgeInsets.symmetric(horizontal:  16.w,),
  width: double.infinity,
  height: 60.h,
  decoration: BoxDecoration(color:ColorsManager.red, ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         InkWell(
          onTap: (){
                                  _launchYoutubeUrl();

          },
           child: SizedBox(
            width: 120.w,
                      child: Text('New Arrivals',style: TextStyle(
                            color: ColorsManager.white,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                                  decorationColor: ColorsManager.white, // Set underline color to white

                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.montserrat().fontFamily,),),
                    ),
         ),
                 
    SizedBox(width: 0.w),
    
                  
                   InkWell(
                    onTap: (){
                                            _launchYoutubeUrl();

                    },
                     child: SizedBox(
                      width: 120.w,
                      
                      child: Text('Promotion',style: TextStyle(
                            color: ColorsManager.white,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                                  decorationColor: ColorsManager.white, // Set underline color to white

                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.montserrat().fontFamily,),),
                                       ),
                   ),
                
    SizedBox(width: 0.w),
    
                     
                         InkWell(
                          onTap: (){
                                                  _launchYoutubeUrl();

                          },
                           child: Expanded(
                            child: Text('Sales',style: TextStyle(
                            color: ColorsManager.white,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                                  decorationColor: ColorsManager.white, // Set underline color to white

                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.montserrat().fontFamily,),),
                                                   ),
                         ),
                      
      ],
    ),
  )),
  const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Categories",
                                      style: TextStyle(
                                          color: ColorsManager.titleTextColr,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              GoogleFonts.raleway().fontFamily),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 55,
                                  margin: const EdgeInsets.only(left: 10),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.productList.length,
                                    itemBuilder: (context, index) {
                                      final product =
                                          controller.productList[index];
                                      final categoryList = product.category;
                                      if (categoryList != null &&
                                          index < categoryList.length) {
                                        final category = categoryList[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 125,
                                            decoration: BoxDecoration(
                                                // shape: BoxShape.circle,
                                                color: const Color.fromARGB(255, 150, 175, 250),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            child: Text(
                                              category!,
                                              style:const TextStyle(
                                                  color:  ColorsManager.white,

                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        );
                                      }
                                      return null;
                                    },
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
                                //   child: controller.productList.isNotEmpty
                                //       ? ClipRRect(
                                //           borderRadius:
                                //               BorderRadius.circular(10),
                                //           child: Image.asset(
                                //             "assets/images/add_shop_promo.png",
                                //             fit: BoxFit.fill,
                                //           ),
                                //         )
                                //       : Center(
                                //           child: Column(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.center,
                                //             children: [
                                //               Icon(
                                //                 Icons.sentiment_dissatisfied,
                                //                 size: 50,
                                //                 color: ColorsManager.vibrantBlue,
                                //               ),
                                //               const SizedBox(height: 10),
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
                                      child: controller.productList.isNotEmpty
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: GridView.builder(
                                                    primary: false,
                                                    itemCount: controller
                                                        .productList.length,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 10,
                                                      crossAxisCount: 2,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return itemsCardss(
                                                        context: context,
                                                        productId: controller
                                                                .productList[
                                                                    index]
                                                                .id!,
                                                        img: controller
                                                                .productList[
                                                                    index]
                                                                .productImages![0] ??
                                                            "",
                                                        itemName: controller
                                                            .productList[index]
                                                            .name,
                                                        itemPrice: controller
                                                            .productList[index]
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
