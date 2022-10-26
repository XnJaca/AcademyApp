import 'package:acdemy/screen/Home/home_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromARGB(255, 0, 119, 255),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      unselectedItemColor: Color.fromARGB(255, 126, 124, 124),
      items: const [
        BottomNavigationBarItem(
          label: 'Inicio',
          activeIcon: Icon(Icons.home_rounded),
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Eventos',
          activeIcon: Icon(Icons.notifications),
          icon: Icon(Icons.notifications_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Cuenta',
          activeIcon: Icon(Icons.person_rounded),
          icon: Icon(Icons.person_outline),
        )
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
