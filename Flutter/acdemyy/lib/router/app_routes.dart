import 'package:flutter/material.dart';
import 'package:acdemy/models/options.dart';
import '../screen/screens.dart';

// Este clase sirve para controlar las rutas de nuestra aplicacion.
class AppRoutes {
  //Definimos la ruta inicial de la app
  static const initialRoute = 'LoginScreen';

  //Definimos un menu de opciones que usaremos en la pantalla principal.
  static final dashboardOptions = <MenuOptions>[
    MenuOptions(
        route: 'LoginScreen',
        icon: Icons.login_rounded,
        name: 'Login',
        screen: const WelcomeScreen())
  ];

  static Map<String, Widget Function(BuildContext context)> getAppRoutes() {
    Map<String, Widget Function(BuildContext context)> appRoutes = {};

    for (final option in dashboardOptions) {
      appRoutes.addAll({option.route: (_) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const WelcomeScreen());
  }
}
