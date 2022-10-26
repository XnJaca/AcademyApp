import 'package:acdemy/provider/course_provider.dart';
import 'package:acdemy/screen/Cursos/detail_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:acdemy/constants/constants.dart';

class CardTableCourse extends StatelessWidget {
  const CardTableCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: getCouser(),
    );
  }
}

class _SingleCard extends StatelessWidget {
  final CourseProvider course;

  const _SingleCard({required this.course});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CardContainer(course: course, size: size);
  }
}

// - EL contenedor de la tarjeta. - 
class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.course,
    required this.size,
  }) : super(key: key);

  final CourseProvider course;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 253, 253),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 202, 189, 189).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 9,
            offset: const Offset(0.8, 8), // changes position of shadow
          ),
        ],
      ),
      child: CreateCard(course: course, size: size),
    );
  }
}

// - Creamos la tarjeta. -
class CreateCard extends StatelessWidget {
  const CreateCard({
    Key? key,
    required this.course,
    required this.size,
  }) : super(key: key);

  final CourseProvider course; // Agarramos el curso que viene por parametro.
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIcon(course: course),
        const SizedBox(
          width: 10,
        ),
        TextIntoCard(size: size, course: course),
        const SizedBox(width: 10,),
        ArrowButton(
          course: course,
        )
      ],
    );
  }
}


// - Es la imagen circular que aparece en la tarjeta, contiene el thumbnail del curso.
class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.course,
  }) : super(key: key);

  final CourseProvider course;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(160, 206, 206, 206),
            radius: 30,
            child: SizedBox(
              width: double.infinity,
              height: double.maxFinite,
              child: ClipOval(
                child: Center(
                  child: SvgPicture.asset(
                    course.thumbnail,
                    width: double.infinity,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// - Boton de flecha derecha.
class ArrowButton extends StatelessWidget {
  final CourseProvider course;
  const ArrowButton({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailCourseScreen(
                    course: course,
                  ))),
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerRight,
              child: const Icon(Icons.keyboard_arrow_right_rounded)),
        ],
      ),
    );
  }
}

// - Texto dentro de la tarjeta, nombre del curso, profesor, etc,etc -
class TextIntoCard extends StatelessWidget {
  const TextIntoCard({
    Key? key,
    required this.size,
    required this.course,
  }) : super(key: key);

  final Size size;
  final CourseProvider course;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width * 0.55,
          // color: const Color.fromARGB(255, 55, 146, 168),
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  course.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  course.teacher,
                  textAlign: TextAlign.right,
                  style: txtAdventure20,
                ),
              ),
              const SizedBox(height: 10,),
              // - Barra de progreso -
              LinearProgressIndicator(
                value: course.note,
                backgroundColor: Colors.black12,
                color: kPrimaryColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}

// - Obtenemos el curso y devolvemos una tarjeta por cada curso que tengamos. -
List<TableRow> getCouser() {
  List<TableRow> tr = [];
  for (var i = 0; i < courses.length; i++) {
    tr.add(TableRow(children: [
      _SingleCard(course: courses[i]),
    ]));
  }
  return tr;
}
