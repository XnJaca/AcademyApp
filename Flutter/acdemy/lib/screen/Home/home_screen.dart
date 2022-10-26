import 'package:flutter/material.dart';
import 'package:acdemy/widgets/widgets.dart';
import 'package:acdemy/screen/Home/components/home_app_bar.dart';
import 'package:acdemy/screen/Home/components/home_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          HomeBackground(),
          _HomeBody(),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HomeAppBar(),
          //Cards Table
          CardTableCategory(),
          ]
      ),
    );
  }
}
