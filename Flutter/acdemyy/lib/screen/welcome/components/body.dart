import 'package:acdemy/components/rounded_button.dart';
import 'package:acdemy/constants/constants_styles.dart';
import 'package:acdemy/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('BIENVENIDO A ACDEMYC',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "INGRESAR",
              press: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }),
                ),
            ),
            RoundedButton(
              text: "REGISTRARSE",
              txtColor: Colors.black,
              press: () {},
              color: kPrimaryLightColor,
            ),
          ],
        ),
      ),
    );
  }
}
