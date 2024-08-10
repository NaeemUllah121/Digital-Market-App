// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:badges/badges.dart' as badges;

import '../checkout/checkout.dart';
import '../../controllers/cart_controller.dart';
import '../../models/CartModel.dart';
import '../../utill/constants/color_manager.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartController = Get.put(CartController());
  double totalPrice = 0.0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    totalPrice = 0.0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartController.getCartItems();
      cartController.getCount();
    });
    super.initState();
  }

  @override
  Widget build(context) {
    totalPrice = 0.0;
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColr,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorsManager.red,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:  ColorsManager.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: ColorsManager.black,
                ),
              ),
            ),
          ),
        ),
        title: const Center(
          child: Text(
            "Cart",
            style: TextStyle(
              color: ColorsManager.white,
            ),
          ),
        ),
        actions: [
          Obx(() {
            if (cartController.isLoading.value) {
              return const Offstage();
            }
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(),
                badgeStyle: const badges.BadgeStyle(
        badgeColor: ColorsManager.white,
      ),
                badgeContent: Text(
                  cartController.totalItem.value.toString(),
                  style: const TextStyle(color:  ColorsManager.red),
                ),
                child: InkWell(
                  child: const Icon(
                    Icons.shopping_cart,
                    color:  ColorsManager.white,
                    size: 30,
                  ),
                  onTap: () {
                    Get.to(const CartPage());
                  },
                ),
              ),
            );
          }),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Obx(() {
        if (kDebugMode) {
          print("product is : ${cartController.products}");
        }
        if (cartController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (cartController.totalItem < 1) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Cart Empty",
                  style: TextStyle(color:  ColorsManager.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    color: ColorsManager.red,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
                    decoration: const BoxDecoration(
                      
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.orange),
                    child: const Center(
                      child: Text(
                        "Continue To Shop",
                        style: TextStyle(
                            color:  ColorsManager.white,
                            fontFamily: 'circe',
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          double totalPrice1 = 0.0;
          return LoadingOverlay(
            progressIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
            isLoading: false,
            child: Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: Get.height * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(

                            // ignore: missing_return
                            itemCount: cartController.totalItem.value,
                            itemBuilder: (context, index) {
                              totalPrice1 = totalPrice1 +
                                  (double.parse((cartController.products[index]
                                              ["product_price"])
                                          .toString()) *
                                      double.parse((cartController
                                              .products[index]["quantity"])
                                          .toString()));
                              return itemsCard(
                                  img: cartController.products[index]
                                      ["product_image"],
                                  itemName: cartController.products[index]
                                      ["product_name"],
                                  itemPrice: cartController.products[index]
                                      ["product_price"],
                                  totalItems: cartController.products[index]
                                      ["quantity"],
                                  darkColor:  ColorsManager.higherBlue,
                                  product_id: cartController.products[index]
                                      ["product_id"]);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 18),
                        child: Obx(() {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsManager.black),
                                  ),
                                  Text(
                                    cartController.totalPrice.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsManager.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "- - - - - - - - - - - - - - - - - - - - - - -",
                                style: TextStyle(fontSize: 25, color: ColorsManager.black),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Subtotal",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsManager.black),
                                  ),
                                  Text(
                                    cartController.totalPrice.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsManager.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(CheckOut(
                                    totalPrice: cartController.totalPrice,
                                    // ignore: invalid_use_of_protected_member
                                    products: cartController.products.value,
                                  ));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.only(
                                      bottom: 20, right: 30, left: 30),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: ColorsManager.red),
                                  child: const Center(
                                    child: Text(
                                      "Continue to Checkout",
                                      style: TextStyle(
                                          color:  ColorsManager.white,
                                          fontFamily: 'circe',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  itemsCard({img, itemName, itemPrice, totalItems, darkColor, product_id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: cardColor,

          borderRadius: BorderRadius.circular(25),
        ),
        child: Card(
          elevation: 2.0,
          color:  ColorsManager.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    fit: BoxFit.cover,
                    placeholder: (context, val) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.image),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8.0, left: 8.0),
                        child: Text(
                          itemName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, right: 8.0, left: 8.0),
                          child: Text(
                            "RS: $itemPrice",
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: ColorsManager.black,
                                  size: 15,
                                ),
                                onPressed: () {
                                  if (totalItems > 1) {
                                    var cart = CartModel(
                                        product_id: product_id,
                                        quantity: totalItems - 1,
                                        price: itemPrice,
                                        salePrice: itemPrice,
                                        image: img,
                                        name: itemName);
                                    cartController.updateCart(cart);
                                  } else {
                                    cartController.delete(id: product_id);
                                  }
                                  setState(() {
                                    if (totalItems != 0) {
                                      totalItems--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                totalItems.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: ColorsManager.black,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: ColorsManager.black,
                                  size: 15,
                                ),
                                onPressed: () {
                                  var cart = CartModel(
                                      product_id: product_id,
                                      quantity: totalItems + 1,
                                      price: itemPrice,
                                      salePrice: itemPrice,
                                      image: img,
                                      name: itemName);
                                  cartController.updateCart(cart);
                                  setState(() {
                                    totalItems++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  inputField(width, height, labelText, obscureText) {
    return SizedBox(
      width: width > height ? height / 1.3 : width / 1.3,
      height: 55,
      child: TextField(
        keyboardAppearance: Brightness.dark,
        style: const TextStyle(
          color: Color.fromARGB(255, 27, 26, 26),
        ),
        autofocus: false,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 1.0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 1.0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 0.8),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 82, 79, 79),
          ),
        ),
      ),
    );
  }
}
