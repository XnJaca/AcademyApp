import 'package:acdemy/constants/constants_styles.dart';
import 'package:acdemy/screen/dashboard/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Theme(
        data: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'cobbler-sans',
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              bodyLarge: kTitleLarge,
              bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
              displayMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )),
        child: const BottomNavBar());
  }
}