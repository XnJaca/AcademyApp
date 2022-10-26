import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double widht;
  final VoidCallback onTap;
  final Color? color;
  const CustomIconButton(
      {super.key,
      required this.child,
      required this.height,
      required this.widht,
      required this.onTap,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      width: widht,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 2.0,
              spreadRadius: .05,
            )
          ]),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Center(child: child),
      ),
    );
  }
}
