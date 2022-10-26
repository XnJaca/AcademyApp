import 'package:acdemy/constants/colors.dart';
import 'package:acdemy/provider/course_provider.dart';
import 'package:acdemy/screen/Cursos/components/topbar.dart';
import 'package:acdemy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailCourseScreen extends StatefulWidget {
  final CourseProvider course;
  const DetailCourseScreen({Key? key, required this.course}) : super(key: key);

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  int _selectedTag = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void changeTab(int index) {
      setState(() {
        _selectedTag = index;
      });
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(
                  size: size,
                  title: widget.course.name,
                ), // -- TOPBAR --
                const SizedBox(
                  height: 20,
                ),
                CustomHeroImage(
                  routeImg: widget.course.thumbnail,
                ),
                const SizedBox(height: 25),
                Text(
                  widget.course.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 30,
                      fontFamily: 'AdventPro'),
                ),
                const SizedBox(height: 5),
                Text(
                  "Materia impartida por: ${widget.course.teacher}",
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      fontFamily: 'AdventPro'),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTabView(index: _selectedTag, changeTab: changeTab),
                const SizedBox(
                  height: 10,
                ),
                _selectedTag == 0 ? const RubricList() : const Information(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.index, required this.changeTab})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Evaluación", "Información"];

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.12, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
              color: widget.index != index ? Colors.black : Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 228, 227, 227),
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class RubricList extends StatelessWidget {
  const RubricList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        SizedBox(
          height: 50,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Trabajo Cotidiano: "),
                Spacer(),
                Text("25pts"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Tareas:"),
                Spacer(),
                Text("50pts"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Examenes:"),
                Spacer(),
                Text("25pts"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 231, 240, 255),
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Nota Actual:"),
                Spacer(),
                Text("60"),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class LineCard extends StatelessWidget {
  const LineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Para qué educamos? La respuesta más simple y probablemente la más completa es que educamos para la vida y dado que la vida se comparte con otros, educamos para la convivencia. La alfabetización del siglo XXI significa por eso algo más que leer, escribir o entender la aritmética básica; significa poder entender y expresarse en los símbolos de nuestro tiempo, en los diversos lenguajes con los que nos comunicamos y en todos los campos de la vida; en la ciencia y en la tecnología, en la política, en el trabajo y el comercio, en el afecto y en el miedo, en el arte y en la cultura.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            )));
  }
}
