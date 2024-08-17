import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/app_widgets.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  ProductDetail({
    super.key,
    required this.image,
    required this.name,
    required this.detail,
    required this.price,
  });

  String image, name, detail, price;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffef5f1),
      body: Container(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Back Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                // Product Image
                Center(
                  child: Image.network(
                    widget.image,
                    height: 400,
                  ),
                ),
              ],
            ),
            // Product Details
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: AppWidgets.boldWeightTextStyle(),
                        ),
                        Text(
                          "\u20B9${widget.price}",
                          style: const TextStyle(
                            color: Color(0xFFfd6f3e),
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Detail",
                      style: AppWidgets.semiBoldTextStyle(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.detail,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    // Buy Now Button
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFfd6f3e),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Buy now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
