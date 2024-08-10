// ItemSlider widget definition
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/views/products/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemSlider extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String placeholder;
  final VoidCallback onTap;

  const ItemSlider({
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
                  color:  ColorsManager.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.raleway().fontFamily,
                ),
              ),
            ),
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
