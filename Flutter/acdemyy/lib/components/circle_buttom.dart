import 'package:acdemy/constants/constants_styles.dart';
import 'package:flutter/material.dart';

class CircleButtom extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleButtom({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: dPrimaryLight,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
