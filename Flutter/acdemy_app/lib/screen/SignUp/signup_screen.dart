import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:acdemy_app/utilities/constants.dart';
import '../../components/components.dart';
import '../../models/models.dart';
import '../screens.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'ACDEMYAPP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Registrarme',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      data: DataTextField(
                        icon: Icons.credit_card_rounded,
                        label: 'Cedula',
                        placeHolder: 'Ingrese su numero de Cedula.',
                        isPass: false,
                        tfType: TextInputType.text,
                      ),
                    ), // ** BUILD ID TEXTFIELD **
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      data: DataTextField(
                          icon: Icons.person_outline,
                          label: 'Nombre Completo',
                          placeHolder: 'Ingrese su Nombre Completo.',
                          isPass: false,
                          tfType: TextInputType.name),
                    ), // ** BUILD NAME TEXTFIELD **
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      data: DataTextField(
                          icon: Icons.phone,
                          label: 'Numero de Teléfono',
                          placeHolder: 'Ingrese su numero de Teléfono.',
                          isPass: false,
                          tfType: TextInputType.phone),
                    ), // ** BUILD NUMBER PHONE TEXTFIELD **
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      data: DataTextField(
                          icon: Icons.email_outlined,
                          label: 'Correo Electronico',
                          placeHolder: 'Ingrese su Correo Electronico.',
                          isPass: false,
                          tfType: TextInputType.emailAddress),
                    ), // ** BUILD NUMBER PHONE TEXTFIELD **
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      data: DataTextField(
                          icon: Icons.lock_outline,
                          label: 'Contraseña',
                          placeHolder: 'Ingrese su Contraseña.',
                          isPass: true,
                          tfType: TextInputType.text),
                    ), // ** BUILD PASSWORD TEXTFIELD **
                    const _BuildBtnLogin(), // ** SIGN UP BUTTON **
                    const BuildSigInWithText(), //
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class _BuildBtnLogin extends StatelessWidget {
  const _BuildBtnLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        style: sButton,
        onPressed: () => print("Login button pressed"),
        child: const Text(
          'Registrarme',
          style: TextStyle(
              color: Color.fromARGB(255, 3, 49, 99),
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
        ),
      ),
    );
  }
}
