import 'package:acdemy/components/components.dart';
import 'package:flutter/material.dart';

import '../constants/constants_styles.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController tfController;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
    required this.tfController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      controller: tfController,
      obscureText: true,
      onChanged: onChanged,
      decoration: const InputDecoration(
          hintText: "Ingrese su contraseña",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none),
    ));
  }
}
