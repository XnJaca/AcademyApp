import 'package:acdemy/constants/icons.dart';

class CourseProvider {
  String name;
  String description;
  String teacher;
  double note;
  String ausents;
  String thumbnail;


  CourseProvider({
    required this.name,
    required this.description,
    required this.teacher,
    required this.note,
    required this.ausents,
    required this.thumbnail,
  });
}

List<CourseProvider> courses = [
  CourseProvider(
      name: 'Español',
      description: 'Curso de Español',
      teacher: 'Profesor 1',
      note: .80,
      ausents: '0',
      thumbnail: iSpanish),
  CourseProvider(
      name: 'Matematicas',
      description: 'Curso de Matematicas',
      teacher: 'Profesor 2',
      note: .60,
      ausents: '2',
      thumbnail: iMatematics),
  CourseProvider(
      name: 'Sociales',
      description: 'Curso de Estudios Sociales',
      teacher: 'Profesor 2',
      note: .55,
      ausents: '2',
      thumbnail: iHistoria),
  CourseProvider(
      name: 'Ciencias',
      description: 'Curso de Ciencias',
      teacher: 'Profesor 2',
      note: .67,
      ausents: '2',
      thumbnail: iCiencias),
];
