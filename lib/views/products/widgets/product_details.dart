import 'package:digital_market/controllers/cart_controller.dart';
import 'package:digital_market/controllers/product_details_controller.dart';
import 'package:digital_market/models/products_model.dart';
import 'package:digital_market/utill/constants/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../../boxes/boxes.dart';
import '../../../models/local_products/recently_viewed_products.dart';
import '../../Cart/cart_page.dart';
import '../../../models/CartModel.dart';
import '../../../utill/constants/color_manager.dart';
import '../../Home/home_navbar.dart';
import '../../widgets/bottom_nav.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String selectedImage =
      'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProductDetailController productDetailController =
      Get.put(ProductDetailController());
  CartController controller = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    String? selectedProductId = Get.arguments as String?;
    _loadProductDetails(selectedProductId!);
  }

  void _loadProductDetails(String productId) {
    productDetailController.getProduct(productId).then((product) {
      saveProductToHive(product!);
      if (product.productImages != null && product.productImages!.isNotEmpty) {
        setState(() {
          selectedImage = product.productImages!.first;
        });
      }
    });
  }

  void saveProductToHive(ProductsModel product) async {
    try {
      final Box<LocalProducts> box = Boxes.getProducts();

      final bool alreadyExists =
          box.values.any((savedProduct) => savedProduct.id == product.id);
      if (!alreadyExists) {
        final LocalProducts localProduct = LocalProducts(
          id: product.id,
          name: product.name,
          shopImage: product.shopImage,
          shopUrl: product.shopUrl,
          description: product.description,
          productImages: product.productImages,
          category: product.category,
          bannerImage: product.bannerImage,
          price: product.price,
        );
        await box.add(localProduct);
      }
    } catch (e) {
      print('Error saving product to Hive: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.backgroundColr,
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: ColorsManager.red,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsManager.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            StringManager.productDetails,
            style: TextStyle(color: ColorsManager.white),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: badges.Badge(
                        position: badges.BadgePosition.topEnd(),
                        badgeStyle: const badges.BadgeStyle(
                          badgeColor: ColorsManager.white,
                        ),
                        badgeContent: Text(
                          controller.totalItem.value.toString(),
                          style: const TextStyle(color: ColorsManager.red),
                        ),
                        child: InkWell(
                          child: const Icon(
                            Icons.shopping_cart,
                            color: ColorsManager.white,
                            size: 30,
                          ),
                          onTap: () {
                            Get.to(() => const CartPage());
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Obx(() {

                                               controller.open();

          final priceString = productDetailController.productPrice.value;
          final priceValue = int.tryParse(priceString) ?? 0;

          final formattedPrice = NumberFormat("#,##0.00").format(priceValue);
          if (productDetailController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.buttonColr,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Large Image with Hero Animation
                  Obx(() {
                    return Hero(
                      tag: productDetailController.selectedImage.value,
                      child: GestureDetector(
                        onTap: () {
                          // Open a larger view of the selected image
                          // Implement this based on your requirements
                        },
                        child: SizedBox(
                          height: 200,
                          child: Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0)),
                              child: productDetailController.productData !=
                                          null &&
                                      productDetailController.productData!
                                          .productImages!.isNotEmpty
                                  ? Image.network(
                                      productDetailController
                                          .selectedImage.value,
                                      fit: BoxFit.cover,
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: ColorsManager.buttonColr,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  // Image List
                  SizedBox(
                    height: 100.0,
                    child: productDetailController
                                    .productData?.productImages !=
                                null &&
                            productDetailController
                                .productData!.productImages!.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productDetailController
                                .productData?.productImages!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    productDetailController.selectedImage.value =
                                        productDetailController
                                            .productData?.productImages![index];
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          productDetailController.productData
                                              ?.productImages![index]),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: selectedImage ==
                                              productDetailController
                                                  .productData
                                                  ?.productImages![index]
                                          ? Colors.blue // Highlight the selected image
                                          : Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.buttonColr,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productDetailController.productName.value,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            const Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star_half, color: Colors.yellow),
                                Icon(Icons.star_border, color: Colors.yellow),
                                SizedBox(width: 8.0),
                                Text(
                                  '4.5', // Replace with actual rating
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              productDetailController.productDetails.value,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.grey),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rs: $formattedPrice",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    CartModel cart = CartModel(
                                        quantity: 1,
                                        product_id: productDetailController
                                            .productData?.id
                                            .toString(),
                                        price: double.parse(
                                            productDetailController
                                                    .productData?.price ??
                                                ""),
                                        salePrice: double.parse(
                                            productDetailController
                                                    .productData?.price ??
                                                ""),
                                        name: productDetailController
                                            .productData?.name,
                                        image: productDetailController
                                            .selectedImage.value);
                                    await controller.insert(cart);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add_shopping_cart,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 8.0),
                                        Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Similar Products',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                    child: productDetailController.productsList.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                productDetailController.productsList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _loadProductDetails(productDetailController
                                      .productsList[index].id.toString() ??'');
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          productDetailController
                                              .productsList[index]
                                              .productImages?[0]),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.buttonColr,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          }
        }));
  }

  Widget buildFeatureItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 8.0),
          Text(text, style: const TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}
