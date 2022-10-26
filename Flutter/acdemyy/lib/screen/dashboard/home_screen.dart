import 'package:acdemy/components/circle_buttom.dart';
import 'package:acdemy/components/components.dart';
import 'package:acdemy/provider/user_provider.dart';
import 'package:acdemy/screen/dashboard/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: const [AppBar(), BodyDashBoard()],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    final usrProvider = Provider.of<UserProvider>(context, listen: true);
    final User? userr = usrProvider.logUser;
    int time = DateTime.now().hour;

    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: size.height * 0.22,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xff886ff2),
            Color(0xff6849ef),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                saludo(time),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CircleButtom(icon: Icons.notifications, onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedContainer(
            text: userr!.name,
            icon: Icons.person,
          ),
        ],
      ),
    );
  }
}

String saludo(int hour) {
  String resp = "Hola,\n¡Buenos dias! 👋";
  if (hour < 12) {
    return resp;
  } else if (hour > 12 && hour <= 18) {
    return resp = "Hola,\n¡Buenas Tardes! 👋";
  } else {
    return resp = "Hola,\n¡Buenas Noches! 👋";
  }
}
