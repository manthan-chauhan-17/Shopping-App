import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/screens/category_products.dart';
import 'package:shopping_app/services/shared_pref.dart';
import 'package:shopping_app/widgets/app_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "assets/images/headphone_icon.png",
    "assets/images/laptop.png",
    "assets/images/TV.png",
    "assets/images/watch.png",
  ];

  List categoryName = [
    "Headphone",
    "Laptop",
    "TV",
    "Watch",
  ];

  String? name, image;

  getTheSharedPref() async {
    name = await SharedPreferenceHelper().getUserName();
    image = await SharedPreferenceHelper().getUserImage();

    setState(() {});
  }

  onTheLoad() async {
    await getTheSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: name == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey," + name!,
                            style: AppWidgets.boldWeightTextStyle(),
                          ),
                          Text(
                            "Good Morning",
                            style: AppWidgets.lightWeightTextStyle(),
                          )
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          "assets/images/demo-user.jpg",
                          height: 70.0,
                          width: 70.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Product",
                        hintStyle: AppWidgets.lightWeightTextStyle(),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: AppWidgets.semiBoldTextStyle(),
                      ),
                      const Text(
                        "see all",
                        style: TextStyle(
                          color: Color(0xFFfd6f3e),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 130,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFfd6f3e),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20.0),
                          height: 130,
                          child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                image: categories[index],
                                categoryName: categoryName[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All products",
                        style: AppWidgets.semiBoldTextStyle(),
                      ),
                      const Text(
                        "see all",
                        style: TextStyle(
                          color: Color(0xFFfd6f3e),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 240,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        AllProductsContainer(
                          imageName: "headphone2.png",
                          productName: "Headphone",
                          price: 1000,
                        ),
                        AllProductsContainer(
                          imageName: "laptop.png",
                          productName: "Laptop",
                          price: 50000,
                        ),
                        AllProductsContainer(
                          imageName: "watch2.png",
                          productName: "Watch",
                          price: 500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.image, required this.categoryName});

  String image, categoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProducts(category: categoryName),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            const Icon(Icons.arrow_right_alt),
          ],
        ),
      ),
    );
  }
}

class AllProductsContainer extends StatelessWidget {
  AllProductsContainer({
    super.key,
    required this.imageName,
    required this.productName,
    required this.price,
  });

  String imageName;
  String productName;
  int price;

  @override
  Widget build(BuildContext context) {
    return // Headphone
        Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Image.asset(
            "assets/images/$imageName",
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          Text(
            productName,
            style: AppWidgets.semiBoldTextStyle(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                "\u20B9$price",
                style: const TextStyle(
                  color: Color(0xFFfd6f3e),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 40.0,
              ),
              Container(
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
            ],
          )
        ],
      ),
    );
  }
}
