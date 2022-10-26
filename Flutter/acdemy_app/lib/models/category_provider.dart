import 'package:flutter/foundation.dart';

class CategoryProvider{
  String thumbnail;
  String name;
  int noOfCourses;

  CategoryProvider({
    required this.name,
    required this.thumbnail,
    required this.noOfCourses,
  });
}
List<CategoryProvider> categoryList = [
  CategoryProvider(name: 'Materia', thumbnail: thumbnail, noOfCourses: noOfCourses)
]