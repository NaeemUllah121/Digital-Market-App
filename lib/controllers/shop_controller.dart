import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_market/models/shop_model.dart';
import 'package:get/get.dart';


class ShopController extends GetxController with StateMixin<ShopModel> {
  RxBool isLoading = true.obs;
  List<ShopModel> eventList = [];

  Future<List<ShopModel>?> getShops(String? marketName) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance
        .collection("shops")
        .where("marketName", isEqualTo: marketName)
        .get();

    var valMall = await FirebaseFirestore.instance
        .collection("shops")
        .where("mallName", isEqualTo: marketName)
        .get();

    var documents = [...val.docs, ...valMall.docs];

    if (documents.isNotEmpty) {
      eventList.clear();
      update();
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          eventList.add(
              ShopModel.fromFireStore(Map<String, dynamic>.from(data[i])));
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
