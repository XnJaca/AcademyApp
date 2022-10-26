import 'package:acdemy/models/route_options.dart';
import 'package:acdemy/screen/Cursos/cursos_screen.dart';
import 'package:acdemy/screen/Cursos/detail_course_screen.dart';
import 'package:acdemy/screen/Home/home_screen.dart';
import 'package:acdemy/screen/screens.dart';
import 'package:flutter/material.dart';

// Este clase sirve para controlar las rutas de nuestra aplicacion.
class AppRoutes {
  //Definimos la ruta inicial de la app
  static const initialRoute = 'LoginScreen';

  //Definimos un menu de opciones que usaremos en la pantalla principal.
  static final routes = <RouteOptions>[
    RouteOptions(
        route: 'LoginScreen',
        icon: Icons.login_rounded,
        name: 'Login',
        screen: const LoginScreen()),
    RouteOptions(
        route: 'HomeScreen',
        icon: Icons.home_rounded,
        name: 'Home',
        screen: const HomeScreen()),
    RouteOptions(
        route: 'CursosScreen',
        icon: Icons.home_rounded,
        name: 'Cursos',
        screen: const CursosScreen()),
  ];

  // static Map<String, Widget Function(BuildContext context)> routes = {
  //   'HomeScreen': (BuildContext context) => const HomeScreen(),
  //   'Listview1': (BuildContext context) => const ListView1Screen(),
  //   'Listview2': (BuildContext context) => const ListView2Screen(),
  // };

  // static

  static Map<String, Widget Function(BuildContext context)> getAppRoutes() {
    Map<String, Widget Function(BuildContext context)> appRoutes = {};

    for (final option in routes) {
      appRoutes.addAll({option.route: (_) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
