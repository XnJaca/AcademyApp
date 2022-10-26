import 'package:acdemy_app/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate(const [_OptionsDash()]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UsersProvider>(context);

    // print(userProvider.UsersList);

    return const SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('Bienvenido'),
        background: FadeInImage(
          placeholder: NetworkImage(
              'https://cdn.dribbble.com/users/397346/screenshots/1434671/db2.gif'),
          image: AssetImage('assets/img/education1.webp'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _OptionsDash extends StatelessWidget {
  const _OptionsDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: NetworkImage(
                    'https://cdn.dribbble.com/users/397346/screenshots/1434671/db2.gif'),
                image: NetworkImage(
                    'https://4kwallpapers.com/images/walls/thumbs_2t/4992.jpg'),
                height: 100,
              ),
            )
          ],
        ));
  }
}
