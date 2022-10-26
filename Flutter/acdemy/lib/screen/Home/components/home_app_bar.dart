import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: size.height * 0.15,
      width: size.width * 1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                saludo(),
                style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              // CircleButtom(icon: Icons.notifications, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  String saludo() {
    int hour = DateTime.now().hour;
    String resp = "¡Buenos dias! 👋\nBienvenido Jonathan";
    if (hour < 12) {
      return resp;
    } else if (hour > 12 && hour <= 18) {
      return resp = "¡Buenas tardes! 👋\nBienvenido Jonathan";
    } else {
      return resp = "¡Buenas noches! 👋\nBienvenido Jonathan";
    }
  }
}
