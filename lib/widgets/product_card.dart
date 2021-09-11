import 'package:flutter/material.dart';
import 'package:project_foureyes/screens/view_item_screen.dart';

class ProductCard extends StatelessWidget {
  ProductCard({required this.image, required this.price, required this.title});
  late final String image;
  late final String title;
  late final double price;

  @override
  Widget build(BuildContext context) {
    double getProductCardTextSize() {
      if ((MediaQuery.of(context).orientation == Orientation.portrait ||
              MediaQuery.of(context).orientation == Orientation.landscape) &&
          (MediaQuery.of(context).size.longestSide < 600 &&
              MediaQuery.of(context).size.shortestSide < 450)) {
        return 12;
      } else if ((MediaQuery.of(context).orientation == Orientation.portrait ||
              MediaQuery.of(context).orientation == Orientation.landscape) &&
          (MediaQuery.of(context).size.longestSide < 900 &&
              MediaQuery.of(context).size.shortestSide < 500)) {
        return 15;
      } else {
        return 24;
      }
    }

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemViewScreen(
                              label: title,
                              image: image,
                              price: price,
                            )));
              },
              child: Container(
                height: MediaQuery.of(context).size.longestSide * (0.22),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image),
                      alignment: Alignment.topRight,
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: getProductCardTextSize(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "\$$price",
                          style: TextStyle(fontSize: getProductCardTextSize()),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
