import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_foureyes/screens/cart_screen.dart';

class ItemViewScreen extends StatelessWidget {
  static final String id = "Item view screen";
  ItemViewScreen({this.label, this.image, this.price});
  late final String? image, label;
  late final double? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.longestSide,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.longestSide * 0.5,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            image!,
                          ),
                          fit: BoxFit.fill),
                    ),
                    child: SafeArea(
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
                            IconButton(
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, CartScreen.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Image.asset(
                  //
                  //   fit: BoxFit.fill,
                  //   height: MediaQuery.of(context).size.longestSide * 0.5,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  label!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "\$$price",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text("Burberry Inc.")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket."),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CartScreen.id);
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          type: MaterialType.button,
                          // height: 50,
                          color: Colors.grey.shade600,
                          child: Center(
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(30)),
                      child: FoureyesDropDown(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoureyesDropDown extends StatefulWidget {
  @override
  _FoureyesDropDownState createState() => _FoureyesDropDownState();
}

class _FoureyesDropDownState extends State<FoureyesDropDown> {
  int _dropDownValue = 1;
  int maxItemNumber = 10;
  final List<int> listItems = List.generate(10, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _dropDownValue,
      items: listItems.map((int item) {
        return DropdownMenuItem<int>(
          child: Text(
            ' $item',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          value: item,
        );
      }).toList(),
      onChanged: (int? value) {
        setState(() {
          _dropDownValue = value!;
        });
      },
    );
  }
}
