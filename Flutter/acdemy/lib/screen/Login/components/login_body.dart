import 'package:acdemy/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:acdemy/screen/Login/components/login_background.dart';
import 'package:acdemy/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  dynamic a = AppRoutes.getAppRoutes();
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: LoginBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ACDEMYC',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
            ),
            SvgPicture.asset(
              'assets/icons/login_centerIcon.svg',
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            // ** TEXTFIELD INGRESAR USUARIO **
            RoundedInputField(
              hintText: "Ingrese su Usuario",
              tfController: idController,
              isPass: false,
            ),
            // ** TEXTFIELD INGRESAR CONTRASENA **
            RoundedInputField(
              hintText: "Ingrese su Contraseña",
              tfController: passController,
              isPass: true,
              icon: Icons.lock_outline,
            ),
            RoundedButton(
                text: "INGRESAR",
                press: () => Navigator.pushNamed(context, 'HomeScreen')),
            SizedBox(
              height: size.height * 0.03,
            ),
            HaveAnAccount(
                login: true,
                press: () => Navigator.pushNamed(context, 'HomeScreen')),
          ],
        ),
      ),
    );
  }
}
