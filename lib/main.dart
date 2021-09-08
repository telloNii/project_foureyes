import 'package:flutter/material.dart';
import 'package:project_foureyes/screens/home_screen.dart';
import 'package:project_foureyes/screens/splash_screen.dart';

void main() {
  runApp(ProjectFoureyes());
}
class ProjectFoureyes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id :(context) => SplashScreen(),
        HomeScreen.id : (context) => HomeScreen(),
      },
    );
  }
}
