import 'package:acdemy/constants/colors.dart';
import 'package:flutter/material.dart';

class HaveAnAccount extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const HaveAnAccount({
    Key? key,
    this.login = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "- ¿Aun no tienes cuenta? -" : "- Ya tengo una cuenta -",
          style: const TextStyle(fontSize: 16, color: kPrimaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: press,
          child: Text(login ? "CREAR CUENTA" : "INGRESAR",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: kPrimaryColor)),
        )
      ],
    );
  }
}
