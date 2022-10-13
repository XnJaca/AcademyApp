import 'package:flutter/material.dart';
import '../Utils/constants.dart';
import '../models/custom_tf_params.dart';

class CustomTextField extends StatelessWidget {
  final DataTextField data;

  const CustomTextField({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          data.label,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: ( data.isPass ),
            keyboardType: ( data.tfType ),
            style: const TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                data.icon,
                color: Color.fromARGB(255, 46, 224, 255),
              ),
              hintText: data.placeHolder,
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }
}
