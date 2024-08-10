import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_market/models/products_model.dart';
import 'package:get/get.dart';


class ProductsController extends GetxController with StateMixin<ProductsModel> {
  RxBool isLoading = true.obs;
  List<ProductsModel> productList = [];

  Future<List<ProductsModel>?> getProducts(String? cityName) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance
        .collection("product")
        .where("shopName", isEqualTo: cityName)
        .get();
    var documents = val.docs;
    if (documents.isNotEmpty) {
      productList.clear();
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          productList.add(
              ProductsModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoading.value = false;
        return productList;
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
