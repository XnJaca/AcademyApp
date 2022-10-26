import 'dart:io';

import 'package:flutter/material.dart';
import 'package:acdemy_app/router/app_routes.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';
import 'package:acdemy_app/provider/users_provider.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

// void main() => runApp(AppState());
void main() {
  // HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AcdemyApp',
      theme: ThemeData(fontFamily: 'cobbler-sans'),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      builder: OneContext().builder,
      // navigatorKey: OneContext().key,
    );
  }
}
