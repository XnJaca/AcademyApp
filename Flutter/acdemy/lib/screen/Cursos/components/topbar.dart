import 'package:acdemy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  const TopBar({
    Key? key,
    required this.size, required this.title,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.05,
            // color: Colors.red,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontSize: size.height * 0.03),
              ),
            ),
          ),
          Positioned(
              left: 0,
              child: CustomIconButton(
                height: size.height * 0.05,
                widht: 35,
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back),
              ))
        ],
      ),
    );
  }
}
