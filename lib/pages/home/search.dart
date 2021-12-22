import 'package:flutter/material.dart';
//import 'services/screenAdapter.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //var _keywords;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none)),
              onChanged: (value) {
                //this._keywords = value;
              },
            ),
            height: 30,
            decoration: BoxDecoration(
                color: Color.fromRGBO(233, 233, 233, 0.8),
                borderRadius: BorderRadius.circular(15)),
          ),
          actions: <Widget>[
            InkWell(
              child: Container(
                // height: ScreenAdapter.height(68),
                // width: ScreenAdapter.width(80),
                height: 40,
                width: 50,
                child: Row(
                  children: <Widget>[Text("搜索")],
                ),
              ),
              onTap: () {
                print("开始搜索");
                // Navigator.pushReplacementNamed(context, '/productList',
                //     arguments: {"keywords": this._keywords});
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text("热搜", style: Theme.of(context).textTheme.headline5),
              ),
              Divider(),
              Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 233, 233, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("理论"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 233, 233, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("创新"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 233, 233, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("颠覆"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 233, 233, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("学习"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 233, 233, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("案例"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 233, 233, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("案例"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 233, 233, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("案例"),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                child:
                    Text("历史记录", style: Theme.of(context).textTheme.headline5),
              ),
              Divider(),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text("理论"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("创新"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("案例"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("颠覆"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("学习"),
                  ),
                  Divider(),
                ],
              ),
              SizedBox(height: 100),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Icon(Icons.delete), Text("清空历史记录")],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
