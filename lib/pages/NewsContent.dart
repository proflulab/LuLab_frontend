import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
//注意：Flutter2.2.0之后的版本需要引入下面几个包
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:html/dom.dart' as dom;

// ignore: must_be_immutable
class NewsContent extends StatefulWidget {
  Map arguments;
  NewsContent({Key? key, required this.arguments}) : super(key: key);
  _NewsContentState createState() => _NewsContentState(this.arguments);
}

class _NewsContentState extends State<NewsContent> {
  Map arguments;
  List _list = [];

  _NewsContentState(this.arguments);

  FocusNode? get focusNode => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(this.arguments);
    this._getData();
  }

  _getData() async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${this.arguments["aid"]}";
    var response = await Dio().get(apiUrl);

    setState(() {
      this._list = json.decode(response.data)["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("新闻详情")),
        body: ListView(
          children: <Widget>[
            Text(
              "${this._list.length > 0 ? this._list[0]["title"] : ''}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36),
            ),
            // Text("${this._list.length>0?this._list[0]["content"]:''}")
            Padding(
                padding: EdgeInsets.all(10),
                child: Html(
                    data: """
              ${this._list.length > 0 ? this._list[0]["content"] : ''}
            """,
                    onLinkTap: (String? url, RenderContext context,
                        Map<String, String> attributes, dom.Element? element) {
                      //open URL in webview, or launch URL in browser, or any other logic here
                    },
                    style: {
                      "html": Style(
                        backgroundColor: Colors.white,
                      ),
                      "p": Style(fontSize: FontSize.large),
                      "table": Style(
                        backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                      ),
                      "tr": Style(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      "th": Style(
                        padding: EdgeInsets.all(6),
                        backgroundColor: Colors.grey,
                      ),
                      "td": Style(
                        padding: EdgeInsets.all(6),
                        alignment: Alignment.topLeft,
                      ),
                    },
                    onImageTap: (String? url, RenderContext context,
                        Map<String, String> attributes, dom.Element? element) {
                      //open image in webview, or launch image in browser, or any other logic here
                    })),
            Container(
                width: 375.0, //容器的相关参数
                height: 40.0,
                child: Stack(
                  children: [
                    new Positioned(
                        top: 5,
                        left: 24,
                        child: Container(
                          width: 20,
                          height: 20,
                          child: new IconButton(
                            icon: const Icon(
                              IconData(
                                0xec7f,
                                fontFamily: 'MyIcons点赞',
                              ),
                              size: 20.0,
                            ),
                            tooltip: '',
                            onPressed: () {
                              print('点了一个赞');
                            },
                          ),
                        )),
                    new Positioned(
                        top: 12,
                        left: 55,
                        child: Container(
                            width: 35,
                            height: 20,
                            child: new Text(
                              '点赞',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ))),
                    new Positioned(
                        top: 12,
                        left: 201,
                        child: Container(
                            width: 35,
                            height: 20,
                            child: new Text(
                              '评论',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ))),
                    new Positioned(
                        top: 12,
                        left: 345,
                        child: Container(
                            width: 35,
                            height: 20,
                            child: new Text(
                              '分享',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ))),
                    new Positioned(
                        top: 5,
                        left: 167,
                        child: Container(
                          width: 20,
                          height: 20,
                          child: new IconButton(
                            icon: const Icon(
                              IconData(
                                0xe891,
                                fontFamily: 'MyIcons评论',
                              ),
                              size: 20.0,
                            ),
                            tooltip: '',
                            onPressed: () {
                              print('评论了一下');
                            },
                          ),
                        )),
                    new Positioned(
                        top: 5,
                        right: 80,
                        child: Container(
                          width: 20,
                          height: 20,
                          child: new IconButton(
                            icon: const Icon(
                              IconData(
                                0xe600,
                                fontFamily: 'MyIcons分享',
                              ),
                              size: 20.0,
                            ),
                            tooltip: '',
                            onPressed: () {
                              print('分享了一下');
                            },
                          ),
                        ))
                  ],
                )),
            Container(
                width: 375.0,
                height: 500.0,
                child: new ListView(children: <Widget>[
                  new Container(
                      width: 375.0,
                      height: 140,
                      color: Colors.white,
                      child: Stack(children: [
                        new Positioned(
                            top: 20.0,
                            left: 21.0,
                            child: CircleAvatar(
                              //头像半径
                              radius: 12,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: NetworkImage(
                                  'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                            )),
                        new Positioned(
                            top: 25.0,
                            left: 53.0,
                            child: new Text('用户姓名',
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                ))),
                        new Positioned(
                            top: 50.0,
                            left: 53.0,
                            child: new Container(
                                height: 70,
                                width: 300,
                                child: Text(
                                    '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      //文本的相关参数
                                      fontSize: 10.0,
                                    )))),
                        new Positioned(
                          top: 100.0,
                          left: 0.0,
                          child: Container(
                              width: 375.0, //容器的相关参数
                              height: 40.0,
                              child: Stack(
                                children: [
                                  new Positioned(
                                      top: 5,
                                      left: 24,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xec7f,
                                              fontFamily: 'MyIcons点赞',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('点了一个赞');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 12,
                                      left: 55,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '点赞',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 201,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '评论',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 345,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '分享',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 5,
                                      left: 167,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe891,
                                              fontFamily: 'MyIcons评论',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('评论了一下');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 5,
                                      right: 50,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe600,
                                              fontFamily: 'MyIcons分享',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('分享了一下');
                                          },
                                        ),
                                      ))
                                ],
                              )),
                        ),
                      ])),
                  new Container(
                      width: 375.0,
                      height: 140,
                      color: Colors.white,
                      child: Stack(children: [
                        new Positioned(
                            top: 20.0,
                            left: 21.0,
                            child: CircleAvatar(
                              //头像半径
                              radius: 12,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: NetworkImage(
                                  'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                            )),
                        new Positioned(
                            top: 25.0,
                            left: 53.0,
                            child: new Text('用户姓名',
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                ))),
                        new Positioned(
                            top: 50.0,
                            left: 53.0,
                            child: new Container(
                                height: 70,
                                width: 300,
                                child: Text(
                                    '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      //文本的相关参数
                                      fontSize: 10.0,
                                    )))),
                        new Positioned(
                          top: 100.0,
                          left: 0.0,
                          child: Container(
                              width: 375.0, //容器的相关参数
                              height: 40.0,
                              child: Stack(
                                children: [
                                  new Positioned(
                                      top: 5,
                                      left: 24,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xec7f,
                                              fontFamily: 'MyIcons点赞',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('点了一个赞');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 12,
                                      left: 55,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '点赞',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 201,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '评论',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 345,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '分享',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 5,
                                      left: 167,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe891,
                                              fontFamily: 'MyIcons评论',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('评论了一下');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 5,
                                      right: 50,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe600,
                                              fontFamily: 'MyIcons分享',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('分享了一下');
                                          },
                                        ),
                                      ))
                                ],
                              )),
                        ),
                      ])),
                  new Container(
                      width: 375.0,
                      height: 140,
                      color: Colors.white,
                      child: Stack(children: [
                        new Positioned(
                            top: 20.0,
                            left: 21.0,
                            child: CircleAvatar(
                              //头像半径
                              radius: 12,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: NetworkImage(
                                  'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                            )),
                        new Positioned(
                            top: 25.0,
                            left: 53.0,
                            child: new Text('用户姓名',
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                ))),
                        new Positioned(
                            top: 50.0,
                            left: 53.0,
                            child: new Container(
                                height: 70,
                                width: 300,
                                child: Text(
                                    '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      //文本的相关参数
                                      fontSize: 10.0,
                                    )))),
                        new Positioned(
                          top: 100.0,
                          left: 0.0,
                          child: Container(
                              width: 375.0, //容器的相关参数
                              height: 40.0,
                              child: Stack(
                                children: [
                                  new Positioned(
                                      top: 5,
                                      left: 24,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xec7f,
                                              fontFamily: 'MyIcons点赞',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('点了一个赞');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 12,
                                      left: 55,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '点赞',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 201,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '评论',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 345,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '分享',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 5,
                                      left: 167,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe891,
                                              fontFamily: 'MyIcons评论',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('评论了一下');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 5,
                                      right: 50,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe600,
                                              fontFamily: 'MyIcons分享',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('分享了一下');
                                          },
                                        ),
                                      ))
                                ],
                              )),
                        ),
                      ])),
                  new Container(
                      width: 375.0,
                      height: 140,
                      color: Colors.white,
                      child: Stack(children: [
                        new Positioned(
                            top: 20.0,
                            left: 21.0,
                            child: CircleAvatar(
                              //头像半径
                              radius: 12,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: NetworkImage(
                                  'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                            )),
                        new Positioned(
                            top: 25.0,
                            left: 53.0,
                            child: new Text('用户姓名',
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                ))),
                        new Positioned(
                            top: 50.0,
                            left: 53.0,
                            child: new Container(
                                height: 70,
                                width: 300,
                                child: Text(
                                    '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      //文本的相关参数
                                      fontSize: 10.0,
                                    )))),
                        new Positioned(
                          top: 100.0,
                          left: 0.0,
                          child: Container(
                              width: 375.0, //容器的相关参数
                              height: 40.0,
                              child: Stack(
                                children: [
                                  new Positioned(
                                      top: 5,
                                      left: 24,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xec7f,
                                              fontFamily: 'MyIcons点赞',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('点了一个赞');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 12,
                                      left: 55,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '点赞',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 201,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '评论',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 345,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '分享',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 5,
                                      left: 167,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe891,
                                              fontFamily: 'MyIcons评论',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('评论了一下');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 5,
                                      right: 50,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe600,
                                              fontFamily: 'MyIcons分享',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('分享了一下');
                                          },
                                        ),
                                      ))
                                ],
                              )),
                        ),
                      ])),
                  new Container(
                      width: 375.0,
                      height: 140,
                      color: Colors.white,
                      child: Stack(children: [
                        new Positioned(
                            top: 20.0,
                            left: 21.0,
                            child: CircleAvatar(
                              //头像半径
                              radius: 12,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: NetworkImage(
                                  'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                            )),
                        new Positioned(
                            top: 25.0,
                            left: 53.0,
                            child: new Text('用户姓名',
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                ))),
                        new Positioned(
                            top: 50.0,
                            left: 53.0,
                            child: new Container(
                                height: 70,
                                width: 300,
                                child: Text(
                                    '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      //文本的相关参数
                                      fontSize: 10.0,
                                    )))),
                        new Positioned(
                          top: 100.0,
                          left: 0.0,
                          child: Container(
                              width: 375.0, //容器的相关参数
                              height: 40.0,
                              child: Stack(
                                children: [
                                  new Positioned(
                                      top: 5,
                                      left: 24,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xec7f,
                                              fontFamily: 'MyIcons点赞',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('点了一个赞');
                                            FocusScope.of(context)
                                                .requestFocus(focusNode);
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 12,
                                      left: 55,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '点赞',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 201,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '评论',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 12,
                                      left: 345,
                                      child: Container(
                                          width: 35,
                                          height: 20,
                                          child: new Text(
                                            '分享',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                  new Positioned(
                                      top: 5,
                                      left: 167,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe891,
                                              fontFamily: 'MyIcons评论',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('评论了一下');
                                          },
                                        ),
                                      )),
                                  new Positioned(
                                      top: 5,
                                      right: 50,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: new IconButton(
                                          icon: const Icon(
                                            IconData(
                                              0xe600,
                                              fontFamily: 'MyIcons分享',
                                            ),
                                            size: 10.0,
                                          ),
                                          tooltip: '',
                                          onPressed: () {
                                            print('分享了一下');
                                          },
                                        ),
                                      ))
                                ],
                              )),
                        ),
                      ])),
                ]) //容器内的文字，大小，颜色等参数

                ),
          ],
        ));
  }
}
