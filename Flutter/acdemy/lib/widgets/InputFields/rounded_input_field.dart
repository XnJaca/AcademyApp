import 'package:acdemy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:acdemy/constants/colors.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color color;
  final TextEditingController tfController;
  final ValueChanged<String>? onChanged;
  final bool isPass;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.color = kPrimaryColor,
    this.onChanged,
    required this.tfController, required this.isPass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: (isPass == true) ? true : false,
        controller: tfController,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: color,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
