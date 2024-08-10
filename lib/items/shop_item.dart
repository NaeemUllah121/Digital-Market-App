// ShopItem widget definition
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/utill/constants/string_manager.dart';
import 'package:digital_market/views/products/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String placeholder;
  final VoidCallback onTap;

  const ShopItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.placeholder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          Get.to(() => const ProductDetailsPage(), arguments: title);
        },
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, val) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.image),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              bottom: 0,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color:  ColorsManager.red,
                  fontWeight: FontWeight.w900,
                  fontFamily: GoogleFonts.raleway().fontFamily,
                ),
              ),
            ),
            // Positioned(
            //   left: 10,
            //   bottom: 10,
            //   child: Row(
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           _launchYoutubeUrl();
            //         },
            //         child: const Text(
            //           StringManager.newArrival,
            //           style: TextStyle(
            //             decoration: TextDecoration.underline,
            //             fontSize: 22,
            //             color:ColorsManager.vibrantPeach,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           _launchYoutubeUrl();
            //         },
            //         child: const Text(
            //           StringManager.sales,
            //           style: TextStyle(
            //             decoration: TextDecoration.underline,
            //             fontSize: 25,
            //             color:  ColorsManager.vibrantAmber,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          
          ],
        ),
      ),
    );
  }

  void _launchYoutubeUrl() async {
    final Uri url = Uri.parse('https://www.youtube.com/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
