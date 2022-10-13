import 'package:acdemy/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/custom_tf_params.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: double.infinity,
                        height: 200.0,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/Logos/acdemy(500x500).png'))),
                        )),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(95, 190, 200, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Hello, Friends!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Digite su usuario y contraseña para ingresar a la plataforma.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 163, 163, 163),
                        ),
                      ),
                    ),
                    CustomTextField(
                      data: DataTextField(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          placeHolder: 'Ingrese su Email.',
                          isPass: false,
                          tfType: TextInputType.emailAddress),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
