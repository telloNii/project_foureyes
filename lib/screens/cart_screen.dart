import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_foureyes/models/cart_items.dart';
import 'package:project_foureyes/screens/home_screen.dart';
import 'package:project_foureyes/widgets/cart_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static final String id = "cart screen";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int cartItemUnit;
  late double price;
  double finalPrice = 0.00;
  double startPrice = 0.00;

  late double totalItemPrice = price * cartItemUnit;

  double getTotalPrice() {
    Provider.of<CartItems>(context, listen: false).cartItems.fold(
        0,
        (previousValue, element) =>
            finalPrice = (startPrice + element.totalItemPrice));
    return finalPrice;
  }

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
                      Navigator.pushNamed(context, HomeScreen.id);
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
                child: ListView.builder(
                    itemCount: Provider.of<CartItems>(context).cartItems.length,
                    itemBuilder: (context, int index) {
                      return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (dismiss) {
                            Provider.of<CartItems>(context, listen: false)
                                .removeItem(index);
                          },
                          child:
                              Provider.of<CartItems>(context).cartItems[index]);
                    })),
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
                      "\$${getTotalPrice().toStringAsFixed(2)}",
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
