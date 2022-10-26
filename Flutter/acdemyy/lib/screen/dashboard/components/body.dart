import 'package:acdemy/screen/dashboard/components/category_row.dart';
import 'package:flutter/material.dart';
import 'package:acdemy/components/components.dart';
import 'package:acdemy/screen/course/course_screen.dart';
import 'package:acdemy/models/category_provider.dart';

class BodyDashBoard extends StatelessWidget {
  const BodyDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Row(
            children: [
              Text(
                "Selecciona una Categoria",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
              child: Expanded(
                child: Scrollbar(
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => CategoryRow(
                              category: categoryList[index],
                            ),
                            childCount: categoryList.length-1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )

        // GridView.builder(
        //   shrinkWrap: true,
        //   itemCount: categoryList.length,
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: 1.2,
        //     crossAxisSpacing: 20,
        //     mainAxisSpacing: 44,
        //   ),
        //   itemBuilder: (context, index) {
        //     return CategoryCard(
        //       category: categoryList[index],
        //       toRoute: const CourseScreen(),
        //     );
        //   },
        // )
      ],
    );
  }
}
