import 'package:flutter/material.dart';
import 'package:project_foureyes/models/cart_items.dart';
import 'package:project_foureyes/screens/cart_screen.dart';
import 'package:project_foureyes/screens/home_screen.dart';
import 'package:project_foureyes/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProjectFoureyes());
}

class ProjectFoureyes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CartItems();
      },
      child: MaterialApp(
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          CartScreen.id: (context) => CartScreen()
        },
      ),
    );
  }
}
