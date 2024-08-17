import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_detail.dart';
import 'package:shopping_app/services/database.dart';

import '../widgets/app_widgets.dart';

// ignore: must_be_immutable
class CategoryProducts extends StatefulWidget {
  CategoryProducts({required this.category, super.key});
  String category;
  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  Stream? categoryStream;

  getOnTheLoad() async {
    categoryStream = await DatabaseMethods().getProducts(widget.category);

    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allProducts() {
    return StreamBuilder(
        stream: categoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Image.network(
                            ds["Product Image"],
                            height: 130,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            ds["Product Name"],
                            style: AppWidgets.semiBoldTextStyle(),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                "\u20B9" + ds["Product Price"],
                                style: const TextStyle(
                                  color: Color(0xFFfd6f3e),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                          image: ds["Product Image"],
                                          name: ds["Product Name"],
                                          detail: ds["Product Detail"],
                                          price: ds["Product Price"]),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFfd6f3e),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff2f2f2),
      ),
      backgroundColor: const Color(0xfff2f2f2),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Expanded(
              child: allProducts(),
            ),
          ],
        ),
      ),
    );
  }
}
