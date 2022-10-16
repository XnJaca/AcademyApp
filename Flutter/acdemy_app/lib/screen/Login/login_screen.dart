import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:acdemy_app/utilities/constants.dart';

import '../../components/components.dart';
import '../../models/models.dart';
import '../screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    horizontal: 40.0, vertical: 120.0),
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
                      'Iniciar Sesion',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'cobbler-sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      data: DataTextField(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          placeHolder: 'Ingrese su Email.',
                          isPass: false,
                          tfType: TextInputType.emailAddress),
                    ), // ** BUILD EMAIL TEXTFIELD **
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomTextField(
                      data: DataTextField(
                          icon: Icons.lock_outline_rounded,
                          label: 'Contraseña',
                          placeHolder: 'Ingrese su Contraseña.',
                          isPass: true,
                          tfType: TextInputType.text),
                    ), // ** BUILD PASSWORD TEXTFIELD **
                    const ForgotPasswordBtn(),
                    SizedBox(
                      height: 20.0,
                      child: Row(
                        children: [
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: rememberMe,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'Remember Me',
                            style: kLabelStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const _BuildBtnLogin(),
                    const BuildSigInWithText(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          CustomSocialBtn(
                              img:
                                  "assets/Logo/facebook.jpg"), // ** CUSTOM SOCIAL MEDIA BUTTON **
                          CustomSocialBtn(
                              img:
                                  "assets/Logo/google.jpg"), // ** CUSTOM SOCIAL MEDIA BUTTON **
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpScreen(),
                        ),
                      ),
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: '¿No tienes cuenta? ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: 'Registrarme!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold))
                      ])),
                    )
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
        onPressed: () => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const DashBoardScreen(),
              ))
        },
        child: const Text(
          'Ingresar',
          style: TextStyle(
              color: Color.fromARGB(255, 3, 49, 99),
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
        ),
      ),
    );
  }
}
