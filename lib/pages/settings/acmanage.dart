import 'package:flutter/material.dart';
import 'acchange.dart';

class AcManagePage extends StatefulWidget {
  @override
  _AcManagePageState createState() => _AcManagePageState();
}

class _AcManagePageState extends State<AcManagePage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '账号管理',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: screenwidth,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 50,
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcChangePage(),
                        ));
                  },
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 3,
                        top: 12,
                        child: Container(
                          height: 35,
                          width: 240,
                          child: Text(
                            '修改账号密码',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 3,
                        top: 12,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: screenwidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                        top: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 3,
                            top: 12,
                            child: Container(
                              height: 35,
                              width: 240,
                              child: Text(
                                '社交账号',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: screenwidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 3,
                            top: 12,
                            child: Container(
                              height: 35,
                              width: 240,
                              child: Text(
                                'QQ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 33,
                            top: 13,
                            child: Text(
                              '未绑定',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 3,
                            top: 12,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: screenwidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 3,
                            top: 12,
                            child: Container(
                              height: 35,
                              width: 240,
                              child: Text(
                                '新浪微博',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 33,
                            top: 13,
                            child: Text(
                              '未绑定',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 3,
                            top: 12,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: screenwidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 3,
                            top: 12,
                            child: Container(
                              height: 35,
                              width: 240,
                              child: Text(
                                '微信',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 33,
                            top: 13,
                            child: Text(
                              '未绑定',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 3,
                            top: 12,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
