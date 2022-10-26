
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () => print('Olvido la contraseña'),
          child: const Text(
            'Olvido su contraseña?',
            style: kLabelStyle,
          ),
        ));
  }
}
