import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/services/database.dart';
import 'package:shopping_app/widgets/app_widgets.dart';

class Order extends StatefulWidget {
  Order({super.key, required this.category});
  String category;
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Stream? orderStream;

  getOnTheLoad() async {
    orderStream = await DatabaseMethods().getProducts(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allOrders() {
    return StreamBuilder(
        stream: orderStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10.0, bottom: 10.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                ds["Product Image"],
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                children: [
                                  Text(
                                    ds["Product Name"],
                                    style: AppWidgets.semiBoldTextStyle(),
                                  ),
                                  Text(
                                    "\u20B9" + ds["Product Price"],
                                    style: const TextStyle(
                                      color: Color(0xFFfd6f3e),
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    );
                  },
                )
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: const Color(0xfff2f2f2),
        title: Text(
          "Current Orders",
          style: AppWidgets.boldWeightTextStyle(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Expanded(
              child: allOrders(),
            ),
          ],
        ),
      ),
    );
  }
}
