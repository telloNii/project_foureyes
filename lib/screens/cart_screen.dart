import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static final String id = "cart screen";
  late final String label;
  late final double price;
  late final String image;
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.thesouthafrican.com/wp-content/uploads/2018/09/41531895_545927159154467_526428184027849164_n.jpg"),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  CartCards(
                      price: 25.99,
                      label: "Fendi Frames",
                      units: 2,
                      image:
                          "assets/images/fendi/photo_2021-09-08_00-27-12.jpg"),
                  CartCards(
                      price: 25.99,
                      label: "Saint Lauren",
                      units: 3,
                      image:
                          "assets/images/saint lauren/photo_2021-09-08_00-27-36.jpg"),
                  CartCards(
                      price: 25.99,
                      label: "Tommy Hillfiger Frames",
                      units: 2,
                      image:
                          "assets/images/tommy hillfiger/photo_2021-09-08_00-28-31.jpg"),
                  CartCards(
                      price: 25.99,
                      label: "Fendi Frames",
                      units: 2,
                      image:
                          "assets/images/fendi/photo_2021-09-08_00-27-12.jpg"),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "\$103.96",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: GestureDetector(
                    child: Material(
                        borderRadius: BorderRadius.circular(30),
                        type: MaterialType.button,
                        // height: 50,
                        color: Colors.grey.shade700,
                        child: Center(
                            child: Text(
                          "BUY NOW",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 50),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
        width: MediaQuery.of(context).size.shortestSide * 0.6,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade700),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.id);
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CartCards extends StatelessWidget {
  CartCards(
      {required this.price,
      required this.label,
      required this.units,
      required this.image});
  late final String image, label;
  late final double price;
  late final int units;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        height: 120,
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                height: 110,
                // width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  top: 8.0,
                  // bottom: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("Men Style"),
                      ],
                    ),
                    Text("\$$price")
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.check_box),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(Icons.remove, size: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            units.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(Icons.add, size: 20),
                        )
                      ],
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
