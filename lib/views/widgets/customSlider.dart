// CustomSliderItem widget definition
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliderItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String placeholder;
  final VoidCallback onTap;

  const CustomSliderItem({super.key, 
    required this.imageUrl,
    required this.title,
    required this.placeholder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            SizedBox(
              height: 180,
              width: 110,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
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
}
