import 'package:flutter/material.dart';

// COLORS

const kPrimaryColor = Color(0xff6849ef);
const kPrimaryLight = Color(0xff8a72f1);

// SIZE
const kBottomNavigationBarItemSize = 24.0;
const kCategoryCardImageSize = 120.0;


const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final sButton = ButtonStyle(
  padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
  elevation: MaterialStateProperty.all(5.0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
);
