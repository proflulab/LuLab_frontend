import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter/material.dart';

class Gather extends StatefulWidget {
  Gather({Key? key}) : super(key: key);

  @override
  _GatherState createState() => _GatherState();
}

class _GatherState extends State<Gather> {
  List<Map> imgList = [
    {
      'url':
          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'
    },
    {
      'url':
          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'
    },
    {
      'url':
          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: contentWidget());
  }

  Widget contentWidget() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              width: 200.0,
              height: 200.0,
              //   child: AspectRatio(
              // aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    imgList[index]['url'],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: imgList.length,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
                loop: true,
                autoplay: true,
              ),
            ),
            //height:150,

            //),
            // Row(
            //   children:<Widget>[

            //   ]
            ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
                      title: Text('案例课直播  学理论不如学案例'),
                      subtitle: Text('介绍：'),
                      trailing: FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("预约"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    height: 100.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
                      title: Text('案例课直播  学理论不如学案例'),
                      subtitle: Text('介绍：'),
                      trailing: FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("预约"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    height: 100.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
                      title: Text('案例课直播  学理论不如学案例'),
                      subtitle: Text('介绍：'),
                      trailing: FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("预约"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    height: 100.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
                      title: Text('案例课直播  学理论不如学案例'),
                      subtitle: Text('介绍：'),
                      trailing: FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("预约"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    height: 100.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
                      title: Text('案例课直播  学理论不如学案例'),
                      subtitle: Text('介绍：'),
                      trailing: FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("预约"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    height: 100.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
                      title: Text('案例课直播  学理论不如学案例'),
                      subtitle: Text('介绍：'),
                      trailing: FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("预约"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    height: 100.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
                      title: Text('案例课直播  学理论不如学案例'),
                      subtitle: Text('介绍：'),
                      trailing: FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("预约"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
