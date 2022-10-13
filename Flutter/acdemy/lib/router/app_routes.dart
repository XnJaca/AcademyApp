import 'package:flutter/material.dart';
import 'package:acdemy/models/dashboard_options.dart';

import '../screens/screens.dart';

class AppRoutes {
  //Definimos la ruta inicial de nuestra app.
  static const initialRoute = 'LoginScreen';

  //Definimos un menu de opciones que usaremos en la pantalla principal.
  static final dashboardOptions = <DashboardOptions>[
    DashboardOptions(
        route: 'LoginScreen',
        icon: Icons.login_rounded,
        name: 'Login',
        screen: const LoginScreen())
  ];

  static Map<String, Widget Function(BuildContext context)> getAppRoutes() {
    Map<String, Widget Function(BuildContext context)> appRoutes = {};

    for (final option in dashboardOptions) {
      appRoutes.addAll({option.route: (_) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
