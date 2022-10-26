import 'package:flutter/material.dart';
import 'package:acdemy/components/components.dart';
import 'package:acdemy/provider/user_provider.dart';
import 'package:acdemy/screen/login/components/components.dart';
import 'package:acdemy/screen/screens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final usrProvider = Provider.of<UserProvider>(context, listen: true);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "INGRESAR",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Ingrese su Usuario",
              tfController: idController,
            ),
            RoundedPasswordField(
              tfController: passController,
            ),
            RoundedButton(
              text: "INGRESAR",
              press: () async {
                if (verifyFields()) {
                  int val = parseId(idController.text);
                  if (val == 0) {
                    return;
                  }
                  dynamic usr =
                      await usrProvider.login(val, passController.text);
                  if (usr == false || usr == "No se encontro el Usuario.") {
                    alertDialog((usr == false) ? "La contraseña es invalida" : usr,
                        QuickAlertType.info);
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const DashBoardScreen();
                        },
                      ),
                    );
                  }
                }
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {},
            )
          ],
        ),
      ),
    );
  }

  bool verifyFields() {
    bool resp = true;
    if (idController.text == "") {
      alertDialog("El campo de usuario no debe estar vacio.", QuickAlertType.error);
      resp = false;
    } else if (passController.text == "") {
      alertDialog(
          "El campo de contraseña no debe estar vacio.", QuickAlertType.error);
      resp = false;
    }
    return resp;
  }

  void alertDialog(String msg, QuickAlertType alertType) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: msg,
    );
  }

  int parseId(String val) {
    int resp = 0;
    try {
      resp = int.parse(val);
    } catch (e) {
      alertDialog("El Usuario solo acepta numeros enteros.", QuickAlertType.warning);
    }
    return resp;
  }
}
