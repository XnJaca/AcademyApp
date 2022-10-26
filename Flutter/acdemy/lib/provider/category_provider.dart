import 'package:acdemy/constants/icons.dart';

class CategoryProvider {
  String thumbnail;
  String name;
  String description;

  CategoryProvider({
    required this.name,
    required this.description,
    required this.thumbnail,
  });
}

List<CategoryProvider> categoryList = [
  CategoryProvider(name: 'Cursos', description: 'Listado de Cursos', thumbnail: iBooks),
  CategoryProvider(name: 'Profesores', description: 'Listado de Profesores', thumbnail: iTeacher),
  CategoryProvider(name: 'Ausencias', description: 'Listado de Ausencias', thumbnail: iCalendarCancel),
  CategoryProvider(name: 'Eventos', description: 'Listado de Eventos', thumbnail: iSchedule),
];
