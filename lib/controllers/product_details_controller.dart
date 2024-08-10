import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_market/models/local_products/recently_viewed_products.dart';
import 'package:digital_market/models/products_model.dart';
import 'package:get/get.dart';

import '../utill/helpers.dart';

class ProductDetailController extends GetxController
    with StateMixin<ProductsModel> {
  RxBool isLoading = true.obs;
  ProductsModel? productData;
  RxString selectedImage = "".obs;
  RxString productName = "".obs;
  RxString productDetails = "".obs;
  RxString productPrice = "".obs;

  List<ProductsModel> productsList = [];
  RxList<ProductsModel> openedProduccts = <ProductsModel>[].obs;
  RxList<LocalProducts> localProducts = <LocalProducts>[].obs;

  @override
  void onInit() {
    getAllSimilarProducts();
    super.onInit();
  }

  void addOpenedProduct(ProductsModel product) {
    openedProduccts.add(product);
  }

  Future<ProductsModel?> getProduct(String id) async {
    isLoading.value = true;
    var val =
        await FirebaseFirestore.instance.collection("product").doc(id).get();
    var documents = val.data();
    if (documents!.isNotEmpty) {
      try {
        productData =
            ProductsModel.fromFireStore(Map<String, dynamic>.from(documents));
        isLoading.value = false;
        selectedImage.value = productData?.shopImage ?? "";
        productName.value = productData?.name ?? "";
        productDetails.value = productData?.description ?? "";
        productPrice.value = productData?.price ?? "";
        return productData;
      } catch (e) {
        isLoading.value = false;
        errorSnackbar(e.toString());
        return null;
      }
    }
    isLoading.value = false;
    return null;
  }

  Future<List<ProductsModel>?> getAllSimilarProducts() async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance.collection('product').get();
    var documents = val.docs;
    if (documents.isNotEmpty) {
      try {
        final data = documents.map((e) => e.data()).toList();
        for (int i = 0; i < data.length; i++) {
          productsList.add(
              ProductsModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoading.value = false;
        return productsList;
      } catch (e) {
        isLoading.value = false;
        return null;
      }
    }
    isLoading.value = false;
    return null;
  }
}
