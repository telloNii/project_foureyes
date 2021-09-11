import 'package:flutter/cupertino.dart';
import 'package:project_foureyes/models/products.dart';
import 'package:project_foureyes/widgets/cart_card.dart';
import 'package:provider/provider.dart';

class CartItems extends ChangeNotifier {
  List<CartCards> cartItems = [];
  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void addToCart(int index, int dropValue) {
    cartItems.add(
      CartCards(
        price: ProductsList().productList[index].price!,
        label: ProductsList().productList[0].label!,
        units: dropValue,
        image: ProductsList().productList[0].image!,
      ),
    );
    notifyListeners();
  }
}
