import 'package:acdemy/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailCourseScreen extends StatefulWidget {
  final String title;
  const DetailCourseScreen({
    super.key,
    required this.title,
  });

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(
                  size: size,
                  title: widget.title,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
