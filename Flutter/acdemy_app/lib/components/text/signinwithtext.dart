
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class BuildSigInWithText extends StatelessWidget {
  const BuildSigInWithText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Text(
          '- OR -',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign In with',
          style: kLabelStyle,
        )
      ],
    );
  }
}