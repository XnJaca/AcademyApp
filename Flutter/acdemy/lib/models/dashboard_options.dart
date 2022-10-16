import 'package:flutter/material.dart' show IconData, Widget;

class DashboardOptions {
  final String route; // -El nombre de la ruta que usaremos. (Ej: LoginScreen)
  final IconData icon; // - El icono que tendra esa ruta.
  final String name; // - Nombre d ela ruta. (Ej: Login)
  final Widget screen; // - El Widget o Screen a la cual navegaremos.

  DashboardOptions(
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});
}
