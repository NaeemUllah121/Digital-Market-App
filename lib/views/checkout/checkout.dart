import 'package:digital_market/views/widgets/adrress_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../controllers/CreateOrderController.dart';
import '../../controllers/PaymentMethodController.dart';
import '../../utill/constants/color_manager.dart';
import '../../utill/constants/values_manager.dart';
import '../widgets/check_out_Input_text.dart';

class CheckOut extends StatefulWidget {
  final totalPrice;
  final List<Map> products;

  const CheckOut({Key? key, this.totalPrice, required this.products})
      : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
 

  bool digitalPayment = false, isActive = true;
  var paymentMethodsController = Get.put(PaymentMethodController());
  var orderController = Get.put(CreateOrderController());
  var methods;
  DateTime todayDate = DateTime.now();
  final _dateController = TextEditingController();
  late DateTime selectedDate;
  List   <PaymentMethod> paymentMethods = [
      PaymentMethod("Cash on Delivery"),
      PaymentMethod("JashCash"),
      PaymentMethod("EasyPaisa"),
      PaymentMethod("Bank Transfer")
    ];

  getMethods() async {
    methods = await paymentMethodsController.getMethods();
  }

  @override
  void dispose() {
    methods = null;
    super.dispose();
  }

void _showPaymentDetails(PaymentMethod paymentMethod) {
    String content;
    switch (paymentMethod.name) {
      case "Cash on Delivery":
        content = "Step 1: Confirm the order.\nStep 2: Prepare cash payment.\nStep 3: Hand over cash to the delivery person.";
        break;
      case "JashCash":
        content = "Step 1: Open JashCash app.\nStep 2: Enter the order amount.\nStep 3: Complete the payment using your JashCash wallet.";
        break;
      case "EasyPaisa":
        content = "Step 1: Open EasyPaisa app.\nStep 2: Enter the order amount.\nStep 3: Complete the payment using your EasyPaisa wallet.";
        break;
      case "Bank Transfer":
        content = "Step 1: Log in to your bank's online banking portal.\nStep 2: Enter the account details provided.\nStep 3: Complete the bank transfer.";
        break;
      default:
        content = "Please select a valid payment method.";
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text("${paymentMethod.name}")),
          content: Text(content),
          actions: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
Widget buildPaymentOption(PaymentMethod paymentMethod) {
    return Row(
      children: [
        Checkbox(
          value: paymentMethod.isSelected,
          onChanged: (value) {
            setState(() {
              paymentMethod.isSelected = value!;
              // Update other payment methods based on selection
              if (value == true) {
                paymentMethods.forEach((method) {
                  if (method != paymentMethod) {
                    method.isSelected = false;
                  }
                });
                                _showPaymentDetails(paymentMethod);

              }
            });
          },
        ),
        Text(
          paymentMethod.name,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMethods();
    });
    super.initState();
  }

  var firstName = TextEditingController();
  var extraNotes = TextEditingController();
  var lastName = TextEditingController();
  var address1 = TextEditingController();
  var address2 = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var postcode = TextEditingController();
  var country = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    country.text = "PK";
    return Scaffold(
      // backgroundColor: ColorsManager.backgroundColr,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorsManager.red,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            color: ColorsManager.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            "Checkout",
            style: TextStyle(color: ColorsManager.white),
          ),
        ),
        actions: [
          Container(
            child: Text(
              'jhgjjgjgjgjsdfg',
              style: TextStyle(color: ColorsManager.red),
            ),
          )
        ],
      ),
      body: Obx(() {

         final priceString = widget.totalPrice.toString();
          final priceValue = int.tryParse(priceString) ?? 0;
          final formattedPrice = NumberFormat("#,##0.00").format(priceValue);

final totalPriceString = widget.totalPrice.toString();
final totalPriceValue = int.tryParse(totalPriceString)?? 0;
final totalPrice = totalPriceValue +250;
final totalFormattedPrice = NumberFormat("#,##0.00").format(totalPrice);
        return LoadingOverlay(
            isLoading: orderController.isLoading.value,
            progressIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
            opacity: 0.3,
            child: SafeArea(
                child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/login_page.png"),
                                fit: BoxFit.fill)),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          color: ColorsManager.white,
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                  "Delivery Address",
                                  style: TextStyle(color: ColorsManager.black),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(
                                          //   height: 15,
                                          // ),
                                          // Text("Delivery Address"),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            'Name',
                                            style: TextStyle(
                                                color: ColorsManager.black),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          AddressTextFields(
                                            controller: firstName,
                                            inputLines: 2,
                                            hintName: "",
                                            inputType: TextInputType.text,
                                            isPass: false,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          const Text(
                                            'Order Date',
                                            style: TextStyle(
                                                color: ColorsManager.black),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          TextFormField(
                                            controller: _dateController,
                                            readOnly: true,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter value';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: ColorsManager
                                                        .textFieldsBackground),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: ColorsManager
                                                        .textFieldsBackground),
                                              ),
                                              errorBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: ColorsManager.red),
                                              ),
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: ColorsManager.red),
                                              ),
                                              disabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: ColorsManager.red),
                                              ),
                                              // hintText: 'Order Date',
                                              hintStyle: const TextStyle(
                                                  fontSize: AppSize.s10,
                                                  color: ColorsManager
                                                      .titleTextColr),
                                              fillColor: ColorsManager
                                                  .textFieldsBackground,
                                              filled: true,
                                              suffixIcon: InkWell(
                                                onTap: () =>
                                                    _selectDate(context),
                                                child: const Icon(
                                                  Icons.calendar_today,
                                                  color: ColorsManager
                                                      .titleTextColr,
                                                ),
                                              ),
                                              errorStyle: const TextStyle(
                                                  color: ColorsManager.red),
                                            ),
                                            keyboardType:
                                                TextInputType.datetime,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          const Text(
                                            'Email',
                                            style: TextStyle(
                                                color: ColorsManager.black),
                                          ),
                                          inputField(
                                              email,
                                              MediaQuery.of(context).size.width,
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              ""),
                                         SizedBox(
                                            height: 6.h,
                                          ),
                                          const Text(
                                            'Contact Number',
                                            style: TextStyle(
                                                color: ColorsManager.black),
                                          ),
                                          AddressTextFields(
                                            inputLines: 2,
                                            controller: phone,
                                            hintName: "",
                                            inputType: TextInputType.text,
                                            isPass: false,
                                          ),

                                         SizedBox(
                                            height: 6.h,
                                          ),
                                          const Text(
                                            'Address',
                                            style: TextStyle(
                                                color: ColorsManager.black),
                                          ),
                                          AddressTextFields(
                                            inputLines: 2,
                                            controller: address1,
                                            hintName: "",
                                            inputType: TextInputType.text,
                                            isPass: false,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          const Text(
                                            'Extra Notes',
                                            style: TextStyle(
                                                color: ColorsManager.black),
                                          ),
                                          AddressTextFields(
                                            inputLines: 5,
                                            controller: extraNotes,
                                            hintName: "",
                                            inputType: TextInputType.text,
                                            isPass: false,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Payment Method",
                                style: TextStyle(color: ColorsManager.black),
                              ),
                              Column(children: [...paymentMethods.map((paymentMethod) => buildPaymentOption(paymentMethod)).toList()],),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Subtotal",
                                    style:
                                        TextStyle(color: ColorsManager.black),
                                  ),
                                  Text(
                                   formattedPrice,
                                    style:
                                        const TextStyle(color: ColorsManager.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery ",
                                    style:
                                        TextStyle(color: ColorsManager.black),
                                  ),
                                  Text(
                                    "250",
                                    style:
                                        TextStyle(color: ColorsManager.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total Amount",
                                    style:
                                        TextStyle(color: ColorsManager.black),
                                  ),
                                  Text(
                                    totalFormattedPrice.toString(),
                                    style:
                                        const TextStyle(color: ColorsManager.black),
                                  ),
                                ],
                              ),
                              const Center(
                                child: Text(
                                  "- - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                                  style: TextStyle(
                                      fontSize: 25, color: ColorsManager.black),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    PaymentMethod selectedMethod = paymentMethods.firstWhere((method) => method.isSelected);
                                    orderController.createOrder(
                                        name: firstName.text,
                                        address: address1.text,
                                        email: email.text,
                                        orderDate: _dateController.text,
                                        phoneNumber: phone.text,
                                        duePayment:
                                            widget.totalPrice.toString(),
                                        totalAmount: int.parse(
                                                widget.totalPrice.toString()) +
                                            250,
                                        deliveryCharges: "250",
                                        paymentMethodTitle:selectedMethod.name,
                                        products: widget.products,
                                        extraNotes: extraNotes.text);
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.only(
                                      bottom: 20, right: 30, left: 30),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.orange),
                                  child: const Center(
                                    child: Text(
                                      "Place Order",
                                      style: TextStyle(
                                          color: ColorsManager.white,
                                          fontFamily: 'circe',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
      }),
    );
    
  }

  inputField(controller, width, height, labelText) {
    return SizedBox(
      width: width > height ? height / 1.1 : width / 1.1,
      height: width > height ? width / 12 : height / 12,
      child: TextFormField(
        keyboardAppearance: Brightness.dark,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "Field RequiColorsManager.red";
          } else if (!RegExp(
                  r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
              .hasMatch(val)) {
            return "Enter a valid email address";
          }
          return null;
        },
        style: const TextStyle(
          color: Color.fromARGB(255, 20, 20, 20),
        ),
        autofocus: false,
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          filled: true,
          fillColor: ColorsManager.textFieldsBackground,
          hintText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 15, 15, 15), width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: ColorsManager.red,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: ColorsManager.textFieldsBackground,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 71, 70, 70),
          ),
        ),
      ),
    );
  }

  preferrenceContainer(text, textColor, containerColor, active) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: active
              ? containerColor
              : const Color.fromARGB(255, 206, 206, 206),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 12.0),
          child: Text(text,
              style: TextStyle(
                color:
                    active ? textColor : const Color.fromARGB(199, 15, 15, 15),
              )),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != todayDate) {
      setState(() {
        _dateController.text = picked.toString().substring(0, 10);
        selectedDate = picked;
      });
    }
  }
}



class PaymentMethod {
  final String name;
  bool isSelected;

  PaymentMethod(this.name, {this.isSelected = false});
}
