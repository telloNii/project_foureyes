import 'package:flutter/material.dart';
import 'package:project_foureyes/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static final String id = "SplashScreenRoute";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    animationController.forward();
    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          Navigator.pushNamed(context, HomeScreen.id);
        }
      },
    );
    animationController.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            "assets/images/foureyes.png",
            height: 180.0 + animation.value * 50,
          ),
        ),
      ),
    );
  }
}
