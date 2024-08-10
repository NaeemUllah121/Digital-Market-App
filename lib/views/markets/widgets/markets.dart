import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_market/controllers/market_controller.dart';
import 'package:digital_market/views/widgets/item_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../../utill/constants/color_manager.dart';
import '../../Home/home_navbar.dart';
import '../../widgets/bottom_nav.dart';
import 'itemCard.dart';

class MarketPage extends GetView<MarketController> {
  @override
  MarketController controller = Get.put(MarketController());
  String title;
  
  MarketPage({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    String? selectedProvince = Get.arguments as String?;
    controller.getMarkets(selectedProvince);
    
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
        title: const Center(
          child: Text('Markets & Malls', style: TextStyle(color: ColorsManager.white)),
        ),
        actions: [
          SizedBox(
            height: 28.h,
            width: 28.w,
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.search,
                color: ColorsManager.white,
                size: 32,
              ),
            ),
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
        ],
      ),
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
                        decoration: BoxDecoration(color: ColorsManager.white),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              child: Text(
                                title,
                                style: TextStyle(color: ColorsManager.red, fontWeight: FontWeight.w900, fontSize: 20),
                              ),
                            ),
                            controller.eventList.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.sentiment_dissatisfied,
                                          size: 50,
                                          color: ColorsManager.vibrantBlue,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Nothing found for this city",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: ColorsManager.vibrantBlue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.width / 1.8,
                                        width: MediaQuery.of(context).size.width,
                                        child: CarouselSlider.builder(
                                          itemCount: controller.eventList.length,
                                          options: CarouselOptions(
                                            height: MediaQuery.of(context).size.width / 2.2,
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            autoPlayInterval: const Duration(seconds: 5),
                                            viewportFraction: 0.9,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                          ),
                                          itemBuilder: (BuildContext context, int index, int realIndex) {
                                            final homeTopBanner = controller.eventList[index];
                                            return ItemSlider(
                                              imageUrl: homeTopBanner.bannerImage!,
                                              title: homeTopBanner.name!,
                                              placeholder: homeTopBanner.name!,
                                              onTap: () {
                                                // Handle tap on the slider item
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: SizedBox(
                                            height: Get.height * 0.9,
                                            child: GridView.builder(
                                              primary: false,
                                              itemCount: controller.eventList.length,
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                                crossAxisCount: 2,
                                              ),
                                              itemBuilder: (context, index) {
                                                return itemsCards(
                                                  context: context,
                                                  img: controller.eventList[index].url,
                                                  itemName: controller.eventList[index].name,
                                                  itemPrice: controller.eventList[index].name,
                                                );
                                              },
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
