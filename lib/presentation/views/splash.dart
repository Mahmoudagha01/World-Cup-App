import 'dart:async';
import 'package:flutter/material.dart';
import 'package:world_cup/helper/constants.dart';
import 'package:world_cup/helper/routs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double fontSize = 2;
  double containerSize = 1.5;
  double titleOpacity = 0.0;
  double containerOpacity = 0.0;
  late AnimationController controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          titleOpacity = 1.0;
        });
      });

    controller.forward();
   
    Timer(const Duration(seconds: 3), () {
      setState(() {
           fontSize = 1.06;
        containerSize = 2;
        containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 7), () {
      setState(() {
        Navigator.pushReplacementNamed(context, AppRoutes.layout);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 5000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: MediaQuery.of(context).size.height / fontSize - 10),
              AnimatedOpacity(
                  duration: const Duration(milliseconds: 5000),
                  opacity: titleOpacity,
                  child: SizedBox(
                      height: 40,
                      child: Image.asset("assets/images/word.png"))),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 4000),
              opacity: containerOpacity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 4000),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 5000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.easeInOutCirc,
              parent: animation,
            );
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
