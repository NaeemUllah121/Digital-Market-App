import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_market/models/city.dart';
import 'package:get/get.dart';


class CityController extends GetxController with StateMixin<CitiesModel> {
  RxBool isLoading = true.obs;
  List<CitiesModel> cityList = [];
  
  
  Future<List<CitiesModel>?> getCities(String? province) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance
        .collection("cities")
        .where("province_of_city", isEqualTo: province)
        .get();
    var documents = val.docs;
    if (documents.isNotEmpty) {
      cityList.clear();
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          cityList.add(
              CitiesModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoading.value = false;
        return cityList;
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
