import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: [0.1, 0.4],
          colors: [Color.fromARGB(255, 252, 252, 252), Colors.white]));
  const HomeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blue Gradient
        Container(decoration: boxDecoration),
        //Top Box
        // const Positioned(child: HomeAppBar()),
      ],
    );
  }
}
