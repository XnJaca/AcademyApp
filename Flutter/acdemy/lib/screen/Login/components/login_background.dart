import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   top: 40,
          //   // left: 0,
          //   right: size.width * 0.05,
          //   child: SvgPicture.asset('assets/icons/acdemyc.svg', width: 100,),
          // ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Image.asset('assets/images/login_top.png'),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset(
          //     'assets/images/login_bottom.png',
          //     width: size.width * 0.7,
          //   ),
          // ),
          child, //Recibimos el child que vamos a poner.
        ],
      ),
    );
  }
}
