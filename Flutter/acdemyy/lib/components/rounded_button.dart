import 'package:flutter/material.dart';

import '../constants/constants_styles.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, txtColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.txtColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              ),
              backgroundColor: MaterialStateProperty.all(color),
            ),
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(color: txtColor, fontSize: 16),
            )),
      ),
    );
  }
}
