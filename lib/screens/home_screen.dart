import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_foureyes/models/brands.dart';
import 'package:project_foureyes/models/home_screen_items.dart';
import 'package:project_foureyes/screens/cart_screen.dart';
import 'package:project_foureyes/screens/view_item_screen.dart';
import 'package:project_foureyes/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  static final String id = "HomeScreenRoute";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String name = "Todd Nelson";

  final String location = "Accra, GH";

  final Color activeColor = Colors.grey.shade600;

  List<ProductCard> _displayItems = displayAllItems;

  @override
  Widget build(BuildContext context) {
    double getGridChildRatio() {
      if (MediaQuery.of(context).orientation == Orientation.portrait &&
          MediaQuery.of(context).size.longestSide < 900) {
        return 0.8;
      } else if (MediaQuery.of(context).orientation == Orientation.landscape &&
          MediaQuery.of(context).size.longestSide < 900) {
        return 1;
      } else {
        return 1.1;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_bag,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  Column(
                    children: [
                      Text(
                        name,
                      ),
                      Text(location)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      print(MediaQuery.of(context).size.longestSide);
                      print(MediaQuery.of(context).size);
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.thesouthafrican.com/wp-content/uploads/2018/09/41531895_545927159154467_526428184027849164_n.jpg"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.sort)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 30,
                child: ListView.builder(
                  itemCount: brands.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _displayItems = selectDisplayBrands[index];
                          });
                        },
                        child: CategoriesCard(label: brands[index]));
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Expanded(
              child: Container(
                  child: GridView.count(
                childAspectRatio: getGridChildRatio(),
                // controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 3,
                children: _displayItems,
              )),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
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

class CategoriesCard extends StatelessWidget {
  CategoriesCard({required this.label});
  late final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
