import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_market/models/markets_model.dart';
import 'package:get/get.dart';


class MarketController extends GetxController with StateMixin<MarketsModel> {
  RxBool isLoading = true.obs;
  List<MarketsModel> eventList = [];

  Future<List<MarketsModel>?> getMarkets(String? cityName) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance
        .collection("market")
        .where("cityName", isEqualTo: cityName)
        .get();
    var documents = val.docs;
    if (documents.isNotEmpty) {
      eventList.clear();
      update();
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          eventList.add(
              MarketsModel.fromFireStore(Map<String, dynamic>.from(data[i])));
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

  Future<List<MarketsModel>?> getMalls(String? cityName) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance
        .collection("shoppingMalls")
        .where("cityName", isEqualTo: cityName)
        .get();
    var documents = val.docs;
    if (documents.isNotEmpty) {
      eventList.clear();
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          eventList.add(
              MarketsModel.fromFireStore(Map<String, dynamic>.from(data[i])));
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
