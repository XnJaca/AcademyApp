import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHeroImage extends StatelessWidget {
  final String routeImg;
  const CustomHeroImage({Key? key, required this.routeImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.2,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 164, 204, 255),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(routeImg)
        ),
      );
  }
}