import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_market/models/city.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../boxes/boxes.dart';
import '../models/banners.dart';
import '../models/local_products/recently_viewed_products.dart';
import '../models/user_data_model.dart';

class HomeController extends GetxController with StateMixin<UserModel> {
  RxBool isLoading = true.obs;
  List<BannersModel> eventList = [];
    List<CitiesModel> citiestList = [];

  UserModel? userModel;
  RxList<LocalProducts> recentlySavedProducts = <LocalProducts>[].obs;
  @override
  void onInit() async {
    await getUserData();
    getCountryBanner();
    getCities('Punjab');
    await recentlyViewedProducts();
    super.onInit();
  }




 Future<List<CitiesModel>?> getCities(String? province) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance
        .collection("cities")
        .get();
    var documents = val.docs;
    if (documents.isNotEmpty) {
      citiestList.clear();
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          citiestList.add(
              CitiesModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoading.value = false;
        return citiestList;
      } catch (e) {
        isLoading.value = false;
        // errorToast("Error", e.toString());
        return null;
      }
    }
    isLoading.value = false;
    // errorSnackbar("No Data Found");
    return null;
  }

  Future<void> recentlyViewedProducts() async {
    try {
      final Box<LocalProducts> box =  Boxes.getProducts();
      recentlySavedProducts.assignAll(box.values.toList());
      update();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching saved products from Hive: $e');
      }
    }
  }

  Future<UserModel?> getUserData() async {
    isLoading.value = true;
    final currentUser = FirebaseAuth.instance;
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where('id', isEqualTo: currentUser.currentUser!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var document = querySnapshot.docs.first;
        var userData = document.data();

        userModel =
            UserModel.fromFirestore(Map<String, dynamic>.from(userData));
        if (kDebugMode) {
          print("User ID: ${document.id}, User Name: ${userModel!.name}");
        }
        isLoading.value = false;
        return userModel;
      } else {
        isLoading.value = false;
        if (kDebugMode) {
          print("User not found");
        }
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Error: $e");
      }
      return null;
    }
  }

  Future<List<BannersModel>?> getCountryBanner() async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance.collection("province").get();
    var documents = val.docs;
    if (documents.isNotEmpty) {
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          eventList.add(
              BannersModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoading.value = false;
        return eventList;
      } catch (e) {
        isLoading.value = false;
        // errorToast("Error", e.toString());
        return null;
      }
    }
    isLoading.value = false;
    // errorSnackbar("No Data Found");
    return null;
  }
}
