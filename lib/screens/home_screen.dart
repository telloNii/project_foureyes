import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final String id = "HomeScreenRoute";
  final String name = "Todd Nelson";
  final String location = "Accra, GH";
  final Color activeColor = Colors.grey.shade600;
  @override
  Widget build(BuildContext context) {
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
                      List ints = [44, 42, 67];
                      num sum = 0;
                      ints.forEach((element) {
                        sum += element;
                      });
                      print(sum);
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("All"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("GUCCI"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("DIOR"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("PRADA"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("BURBERRY"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("SAINT LAUREN"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("TOMMY HILLFIGER"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("FENDI"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text("OTHERS"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  child: GridView.count(
                childAspectRatio:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 0.8
                        : 1,
                // controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 3,
                children: [
                  ProductCard(
                      image: "assets/images/fendi/fiery FENDI.jpg",
                      price: 25.99,
                      title: "Fendi  Frames"),
                  ProductCard(
                      image:
                          "assets/images/saint lauren/photo_2021-09-08_00-27-36.jpg",
                      price: 39.99,
                      title: "Saint Lauren Frames"),
                  ProductCard(
                      image:
                          "assets/images/burberry/photo_2021-09-08_00-28-37.jpg",
                      price: 19.99,
                      title: "Burberry Frames"),
                  ProductCard(
                      image: "assets/images/dior/photo_2021-09-08_00-27-25.jpg",
                      price: 25.99,
                      title: "Christian Dior Frames"),
                  ProductCard(
                      image:
                          "assets/images/prada/photo_2021-09-08_00-28-59.jpg",
                      price: 22.00,
                      title: "Prada Frames"),
                  ProductCard(
                      image:
                          "assets/images/tommy hillfiger/photo_2021-09-08_00-28-31.jpg",
                      price: 30.00,
                      title: "Tommy Hillfiger Frames"),
                  ProductCard(
                      image: "assets/images/yilina/Yilina TR eyewear.jpg",
                      price: 19.99,
                      title: "Yilina Frames"),
                  ProductCard(
                      image: "assets/images/fendi/fiery FENDI.jpg",
                      price: 25.99,
                      title: "Fendi  Frames"),
                  ProductCard(
                      image:
                          "assets/images/burberry/photo_2021-09-08_00-28-37.jpg",
                      price: 19.99,
                      title: "Burberry Frames"),
                  ProductCard(
                      image:
                          "assets/images/tommy hillfiger/photo_2021-09-08_00-28-31.jpg",
                      price: 30.00,
                      title: "Tommy Hillfiger Frames"),
                ],
              )),
            ),
            Container(
              height: 50.0,
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade700),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({required this.image, required this.price, required this.title});
  late final String image;
  late final String title;
  late final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    alignment: Alignment.topRight,
                    fit: BoxFit.fill),
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("\$$price"),
            )
          ]),
        ));
  }
}
