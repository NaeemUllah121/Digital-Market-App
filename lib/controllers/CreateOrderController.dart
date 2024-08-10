// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../views/checkout/SuccessScreen.dart';
import '../utill/helpers.dart';
import 'cart_controller.dart';

class LineItem {
  final product_id;
  final quantity;

  LineItem(this.product_id, this.quantity);
}

class CreateOrderController extends GetxController {
  var cartController = Get.put(CartController());
  var productsResponse = {}.obs;
  var isLoading = false.obs;
  var isListNull = false.obs;

  FirebaseFirestore fire = FirebaseFirestore.instance;

  createOrder({
    name,
    email,
    orderDate,
        address,

    phoneNumber,
    duePayment,
    totalAmount,
    deliveryCharges,
    paymentMethodTitle,
    products,
    extraNotes,
  }) async {
    isLoading(true).obs;
    try {
      if (kDebugMode) {
        print("id: ${products[0]["product_id"]}");
      }

      DocumentReference ref =
          FirebaseFirestore.instance.collection('orders').doc();
      await fire.collection('orders').doc(ref.id).set({
        'id': ref.id.toString(),
        "name": name,
        "delivery_address": address,
        "order_date": orderDate,
        "email": email,
        "phone": phoneNumber,
        "total_amount": totalAmount,
        "delivery_charges": deliveryCharges,
        "due_amount": duePayment,
        'product': products,
        'status': "Order Placed",
        'p_method_title': paymentMethodTitle,
        'extraNotes': extraNotes
      });
      isLoading(false).obs;
      // Get.snackbar(
      //   'Congratulations',
      //   'Your order has been placed successfully! Shop More',
      //   snackPosition: SnackPosition.BOTTOM,
      //   duration: const Duration(seconds: 3),
      //   backgroundColor:  ColorsManager.buttonColr,
      //   colorText:  ColorsManager.white,
      // );
      // Future.delayed(const Duration(seconds: 2), () {
      cartController.clearData();

      Get.offAll(() => const SuccessScreen());
    } catch (e) {
      isLoading(false).obs;
      errorSnackbar(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

// Future<void> sendConfirmationationEmail(String emailController,
//     String subject, String text) async {
//   final smtpServer = gmail(emailSenderAdress, emailSenderAddressPassword);
//
//   final message = Message()
//     ..from = Address(emailSenderAdress)
//     ..recipients.add(emailController)
//     ..subject = subject
//     ..text = text;
//
//   try {
//     final sendReport = await send(message, smtpServer);
//     print('Message sent: ${sendReport.toString()}');
//   } catch (e) {
//     print('Error sending email: $e');
//   }
// }
// }
}
