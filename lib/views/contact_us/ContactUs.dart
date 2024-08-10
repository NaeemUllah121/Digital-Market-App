import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/views/widgets/RoundedAppBar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const RoundedAppBar(title: 'Contact Us',),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 250,
                          decoration:  const BoxDecoration(
                              color: ColorsManager.black,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)
                              )
                          ),
                          child:  Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 18,
                              color:  ColorsManager.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('assets/images/meeting.png'),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Digital Market',
                          style: TextStyle(
                            fontSize: 24,
                            color:  ColorsManager.higherBlue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat', // Use a professional font
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Version 1.0.0',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Children's Literature Festival (CLF) is now rebranded as the Pakistan Learning Festival (PLF). It offers multi-disciplinary, multi-lingual learning strands for children (3-18), teachers, and college/university students. PLF is a movement to promote social capital and unlock the power of learning, reading, self-expression, and critical thinking.",
                          textAlign: TextAlign.justify, // Adjust text alignment
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Contact Us:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          leading: Icon(Icons.email,color:  ColorsManager.higherBlue,),
                          title: const Text(
                            'info@digitalmarkets.pk',
                            style: TextStyle(
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone,color:  ColorsManager.higherBlue,),
                          title: const Text(
                            'Phone: +92 324 4754754',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor:  ColorsManager.higherBlue),
                          onPressed: () async {
                            final phoneLaunchUri = Uri(
                              scheme: 'tel',
                              path: '+923244754754', // Ensure the phone number is in correct format
                            );
                            if (await canLaunchUrl(phoneLaunchUri)) {
                              await launchUrl(phoneLaunchUri);
                            } else {
                              // Handle the case where the phone app cannot be launched
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Cannot Make Call'),
                                  content: const Text('There is no app available to make the call.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text('Contact Us'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
