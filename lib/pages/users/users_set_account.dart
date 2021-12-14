import 'package:flutter/material.dart';
//import 'PasswordChange.dart';

class AccountSetPage extends StatefulWidget {
  @override
  _AccountSetPageState createState() => _AccountSetPageState();
}

class _AccountSetPageState extends State<AccountSetPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '账号设置',
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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 20,
            child: Container(
              height: 30,
              width: 80,
              padding: EdgeInsets.fromLTRB(3, 7, 0, 0),
              child: Text(
                '密码设置',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 0,
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
                  top: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => PasswordChangePage(),
                  //     ));
                },
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 14,
                      top: 5,
                      child: Container(
                        height: 35,
                        width: 240,
                        child: Text(
                          '修改密码',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 7,
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
            top: 85,
            left: 20,
            child: Container(
              height: 30,
              width: 80,
              padding: EdgeInsets.fromLTRB(3, 7, 0, 0),
              child: Text(
                '账户绑定',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 0,
            child: Container(
              height: 200,
              width: screenwidth,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: screenwidth,
                    decoration: BoxDecoration(
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
                    child: TextButton(
                      onPressed: () {},
                      child: Stack(
                        children: [
                          Positioned(
                            left: 14,
                            top: 5,
                            child: Container(
                              height: 35,
                              width: 240,
                              child: Text(
                                '手机号',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 33,
                            top: 7,
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
                            top: 7,
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
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Stack(
                        children: [
                          Positioned(
                            left: 14,
                            top: 5,
                            child: Container(
                              height: 35,
                              width: 240,
                              child: Text(
                                'QQ',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 33,
                            top: 7,
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
                            top: 7,
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
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Stack(
                        children: [
                          Positioned(
                            left: 14,
                            top: 5,
                            child: Container(
                              height: 35,
                              width: 240,
                              child: Text(
                                '新浪微博',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 33,
                            top: 7,
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
                            top: 7,
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
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Stack(
                        children: [
                          Positioned(
                            left: 14,
                            top: 5,
                            child: Container(
                              height: 35,
                              width: 240,
                              child: Text(
                                '微信',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 33,
                            top: 7,
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
                            top: 7,
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
          ),
        ],
      ),
    );
  }
}
