import 'package:digital_market/controllers/home_controller.dart';
import 'package:digital_market/models/user_data_model.dart';
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/views/Home/widgets/item_promo_banner.dart';
import 'package:digital_market/views/city/Cities.dart';
import 'package:digital_market/views/markets/widgets/markets.dart';
import 'package:digital_market/views/register/register_screen.dart';
import 'package:digital_market/views/terms_and_conditions/terms_and_conditions.dart';
import 'package:digital_market/views/widgets/customSlider.dart';
import 'package:digital_market/views/widgets/custom_drawer.dart';
import 'package:digital_market/views/widgets/home_title_text_widget.dart';
import 'package:digital_market/views/widgets/itemCard.dart';
import 'package:digital_market/views/widgets/item_recently_viewed.dart';
import 'package:digital_market/views/widgets/top_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: Obx(() {
        return LoadingOverlay(
          opacity: 0.3,
          progressIndicator: const CircularProgressIndicator(),
          isLoading: controller.isLoading.value,
          child: SafeArea(
            child: ListView(
              children: [
SizedBox(height: 5.h),
                PromoItemBanner(
                  eventList: const [
                    'assets/images/promo_banner.png',
                    'assets/images/promo_banner.png',
                    'assets/images/promo_banner.png'
                  ],
                ),
                 const SizedBox(height: 15),
              // Horizontal list view
                if(controller.eventList.isNotEmpty)
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.citiestList.length,
                      itemBuilder: (context, index) {
                        final homeTopBanner = controller.citiestList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomSliderItem(
                            imageUrl: homeTopBanner.bannerImage ?? '',
                            title: homeTopBanner.name ?? '',
                            placeholder: homeTopBanner.bannerImage ?? '',
                            onTap: () {
                              Get.to(()=>MarketPage(title: homeTopBanner.name ?? '',),arguments: homeTopBanner.name);
                            },
                          ),
                        );
                      },
                    ),
                  )
            
                else
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sentiment_dissatisfied,
                          size: 50,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Waiting",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
            
                SizedBox(height: 15),
                HomeTitleTextWidget(
                  fontSize: 20.0,
                  title: "Recently Viewed",
                ),
              
 SizedBox(
                  height: 120,
                  child:  Obx(() {
      return controller.recentlySavedProducts.isNotEmpty
          ? SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.recentlySavedProducts.length,
                itemBuilder: (context, index) {
                  String? productImage = controller.recentlySavedProducts[index].shopImage;
                  return ItemRecentlyViewed(productUri: productImage,productId: controller.recentlySavedProducts[index].id.toString(),);
                },
              ),
            )
          : Center(
              child:Image.asset('assets/images/empty_cart.jpg')
              
            );
      }),
 ),
//  const SizedBox(height: 10),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   child: HomeTitleTextWidget(
//                     fontSize: 20.sp,
//                     title: "Province",
//                   ),
//                 ),
            SizedBox(height: 5.h),
                PromoItemBanner(
                  eventList: const [
                    'assets/images/promo_banner.png',
                    'assets/images/promo_banner.png',
                    'assets/images/promo_banner.png'
                  ],
                ),
                SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                      ),
                      itemCount: controller.eventList.length,
                      itemBuilder: (context, index) => itemProvince(
                        img: controller.eventList[index].url ?? '',
                        itemName: controller.eventList[index].name ?? '',
                        itemPrice: controller.eventList[index].marketName ?? '',
                      ),
                    ),
            ),
            
                const SizedBox(height: 20),

              
Container(
  width: double.infinity,
  height: 60.h,
  decoration: BoxDecoration(color:ColorsManager.red, ),
  child: Center(child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:  (context)=>RegistrationScreen()));
                },
                child: Text('Register',style: TextStyle(
                      color: ColorsManager.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.montserrat().fontFamily,),),
              ), 
SizedBox(width: 70.w),
   

                    InkWell(
                      onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:  (context)=>const TermsAndConditionsScreen()));
                },
                      child: Text('T&C',style: TextStyle(
                      color: ColorsManager.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.montserrat().fontFamily,),),
                    ),
    ],
  )),)


           ] )
             ),
          );
        
      }));
    
  }
}
