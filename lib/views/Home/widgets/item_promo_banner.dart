import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoItemBanner extends StatefulWidget {
  PromoItemBanner({Key? key, required this.eventList}) : super(key: key);
  final List<String> eventList;

  @override
  _PromoItemBannerState createState() => _PromoItemBannerState();
}

class _PromoItemBannerState extends State<PromoItemBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          height: 190.h,
          child: CarouselSlider.builder(
            itemCount: widget.eventList.length,
            options: CarouselOptions(
              height: 500.h,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              enlargeFactor: 0.1,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            itemBuilder: (context, index, realIdx) {
              return Container(
                child: Center(
                  child: Image.asset(
                    widget.eventList[index],
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10.h), // Spacing between slider and dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.eventList.length,
            (index) => Container(
              width: 9.w,
              height: 9.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? ColorsManager.red : ColorsManager.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
