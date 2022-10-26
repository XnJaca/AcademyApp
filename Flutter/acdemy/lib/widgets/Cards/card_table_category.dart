import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:acdemy/constants/constants.dart';
import 'package:acdemy/provider/category_provider.dart';

class CardTableCategory extends StatelessWidget {
  const CardTableCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: getCategory(),
    );
  }
}

class _SingleCard extends StatelessWidget {
  final dynamic category;

  const _SingleCard({required this.category});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CardContainer(category: category, size: size);
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.category,
    required this.size,
  }) : super(key: key);

  final CategoryProvider category;
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
      child: Row(
        children: [
          CircleIcon(category: category),
          const SizedBox(
            width: 10,
          ),
          TextIntoCard(size: size, category: category),
          const BtnIntoCard()
        ],
      ),
    );
  }
}

class BtnIntoCard extends StatelessWidget {
  const BtnIntoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'CursosScreen'),
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

class TextIntoCard extends StatelessWidget {
  const TextIntoCard({
    Key? key,
    required this.size,
    required this.category,
  }) : super(key: key);

  final Size size;
  final CategoryProvider category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width * 0.6,
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
                  category.name,
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
                  category.description,
                  textAlign: TextAlign.right,
                  style: txtAdventure20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryProvider category;

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
                    category.thumbnail,
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

List<TableRow> getCategory() {
  List<TableRow> tr = [];
  for (var i = 0; i < categoryList.length; i++) {
    tr.add(TableRow(children: [
      _SingleCard(category: categoryList[i]),
      // _SingleCard(category: categoryList[i + 1]),
    ]));
    // i++;
  }
  return tr;
}

