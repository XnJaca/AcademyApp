import 'package:acdemy/models/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryRow extends StatelessWidget {
  final CategoryProvider category;
  // final Widget toRoute;
  const CategoryRow({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: const Image(
        image: AssetImage('assets/images/login_bottom.png'),
        height: 92.0,
        width: 92.0,
      ),
    );

    const baseTextStyle = TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    Widget _planetValue({String? value, required String image}) {
      return Row(children: <Widget>[
        // Image.asset(image, height: 12.0, width: 20,),
        SvgPicture.asset(image, height: 12.0, width: 20,),
        Container(width: 8.0,),
        Text(category.name, style: regularTextStyle),
      ]);
    }

    final planetCardContent = Container(
      margin: const EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(category.name, style: headerTextStyle),
          Container(height: 10.0),
          Text(category.description, style: subHeaderTextStyle),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: const Color(0xff00c6ff)),
          Row(
            children: <Widget>[
              Expanded(
                  child: _planetValue(
                      value: category.name,
                      image: category.thumbnail)),
              Expanded(
                  child: _planetValue(
                      value: category.description,
                      image: category.thumbnail))
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      height: 124.0,
      margin: const EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: const Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: planetCardContent,
    );

    return Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ));
  }
}
