import 'package:acdemy/constants/size.dart';
import 'package:acdemy/models/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


/// Este widget recibe una categoria para
/// mostrar y la ruta  a la cual ira cuando se presione.
/// @CategoryProvider category
/// @Widget toRoute
class CategoryCard extends StatelessWidget {
  final CategoryProvider category;
  final Widget toRoute;
  const CategoryCard({super.key, required this.category, required this.toRoute});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return toRoute;
                }),
              ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 4.0,
                spreadRadius: .05)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                category.thumbnail,
                height: kCategoryCargImageSize,
              ),
            ),
            const SizedBox(height: 20),
            Text(category.name),
            Text(category.description, style: Theme.of(context).textTheme.bodySmall,)
          ],
        ),
      ),
    );
  }
}
