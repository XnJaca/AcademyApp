import 'package:flutter/material.dart';

class CustomSocialBtn extends StatelessWidget {
  final String img;

  const CustomSocialBtn({
    Key? key, required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Tap to social media button'),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            )
          ],
          image: DecorationImage(
            image: AssetImage(img),
          ),
        ),
      ),
    );
  }
}
