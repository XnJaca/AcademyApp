import 'package:acdemy/components/components.dart';
import 'package:acdemy/models/course_provider.dart';
import 'package:acdemy/screen/course/components/course_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
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
                      child: ListView.separated(
                        shrinkWrap: true,
                          itemBuilder: (_, index){
                            return CourseContainer(
                              course: courses[index],
                            );
                          },
                          separatorBuilder: (context, _){
                            return const SizedBox(height: 10,);
                          },
                          itemCount: courses.length))
                ],
              )),
        ),
      ),
    );
  }
}
