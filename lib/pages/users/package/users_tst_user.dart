import 'package:flutter/material.dart';
import 'users_wast_user.dart';

class Dddg extends StatelessWidget {
  const Dddg({
    Key? key,
    required String title,
  }) : super(key: key);

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
        ),
        title: const Text(
          '隐私政策',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Tty(),
    );
  }
}

class Tty extends StatelessWidget {
  const Tty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text(
              'us dolor non 9uisque pharetra. CI ursus ac aenean morbi senectus sodales at. Viverra massa tincidunt tellus fringilla sed diam adipiscing. sed. In volutpat habitasse integer.'),
        ),
        ListTile(
          title: Text(
              ' dis. Nune neque. 实验室 Lorem ipsum dolor sit amet, adipiscing consectetur elit。ld senectus sed tortor, velit，'),
        ),
        ListTile(
          title: Text(
              ' velit。 Ante risus dui, amet adipiscing enim fames. &uis ristempus lectus ac nunc auctot. Nibh amet vulputate magna odic. Soeiis pellente sque scelerisque viverra maecenas eget rhoncus vestibulum egestas. Sit viverra est rutrum auctor.'),
        ),
      ],
    );
  }
}
