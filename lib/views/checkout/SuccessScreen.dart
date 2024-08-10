import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utill/constants/color_manager.dart';
import '../Home/home_navbar.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorsManager.buttonColr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              color:  ColorsManager.white,
              size: 60,
            ),
            const SizedBox(
              height: 20,
            ),
             Text("Order Placed Successfully",style: TextStyle(color:  ColorsManager.white),),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Get.offAll(const HomeNavbar());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.orange),
                child: const Center(
                  child: Text(
                    "Continue To Shop",
                    style: TextStyle(
                        color:  ColorsManager.white,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
