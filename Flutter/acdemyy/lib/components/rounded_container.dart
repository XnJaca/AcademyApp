import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  const RoundedContainer({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.04,
      width: size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          "Bienvenido $text",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
