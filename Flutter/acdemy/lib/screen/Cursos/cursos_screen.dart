import 'package:acdemy/widgets/Cards/card_table_cursos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:acdemy/screen/Cursos/components/topbar.dart';

class CursosScreen extends StatelessWidget {
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(size: size, title: 'Cursos',), // ** TOPBAR
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: CardTableCourse(),)
                ],
              ),),
        ),
      ),
    );
  }
}
