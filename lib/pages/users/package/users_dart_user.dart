import 'package:flutter/material.dart';
import 'users_wast_user.dart';

class Ff extends StatelessWidget {
  const Ff({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Dty()));
          },
          // padding: EdgeInsets.all(10),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),

          // padding: EdgeInsets.zero,
        ),
        title: const Text(
          '版权声明',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Ty(),
    );
  }
}

class Ty extends StatelessWidget {
  const Ty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text(
              'Lorem ip dolor sit sum amet, adipiscing elit。consectetur Imperdfet viverra aliquet suseipit morbi. '),
        ),
        ListTile(
          title: Text(
              'Elementum ullameorper  pretium dictumst metus ut tortor vestibulum. Bibendum posuere 61andit pretium diam aliquet urna; '),
        ),
        ListTile(
          title: Text(
              'iaculis auctor。 Est ac vitae anet rhoncus enin sed Sit dolor, eu。 viverra accumsan enim tristique  '),
        ),
        ListTile(
          title: Text(
              'consectetur eu varius。  viverra accumsan enim tristique consectetur eu varius。Tellus dictum enin sed. ld urna enin senectus neque turpie.'),
        ),
        ListTile(
          title: Text(
              ' Diam sodales curabitur egestas malesuada telluseget egestas Egestas erat. sit. sceleringue id diam semper habitant odio.'),
        ),
      ],
    );
  }
}
