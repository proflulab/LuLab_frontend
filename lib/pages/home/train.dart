import 'package:flutter/material.dart';

class Train extends StatefulWidget {
  Train({Key? key}) : super(key: key);

  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        height: 241,
        width: 375,
        color: Colors.grey,
        child: Stack(children: [
          new Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.33,
              child: Container(
                height: 241,
                width: 375,
                child: new Image.network(
                    'https://tse3-mm.cn.bing.net/th/id/OIP-C.TjUeHZd1Cs4TxjLBV9KqUAHaE8?pid=ImgDet&rs=1',
                    fit: BoxFit.fill),
              ),
            ),
          ),
          new Positioned(
            top: 31.0,
            left: 63.0,
            child: Container(
                height: 36.0,
                width: 36.0,
                child: Image.asset('assets/image/logo白文.jpg', fit: BoxFit.fill)
                //new Image.asset('image\logo白文.jpg', fit: BoxFit.fill)
                ),
          ),
          new Positioned(
            top: 67.0,
            left: 35.0,
            child: Container(
              height: 21.0,
              width: 107.0,
              child: new Text('Lu.lab训练营',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          new Positioned(
            top: 30.0,
            left: 160.0,
            child: Container(
              height: 100.0,
              width: 135.0,
              child: new Text('学理论不如学案例，学案例不如做案例，做案例不如玩案例，玩案例不如几人玩。',
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          new Positioned(
              top: 8.0,
              right: 11.0,
              child: FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("学员入口"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              )),
          new Positioned(
            top: 114.0,
            left: 30.0,
            child: Container(
              height: 112.0,
              width: 353.0,
              color: Colors.white,
              child: new Image.network(
                  'https://tse1-mm.cn.bing.net/th/id/R-C.bfe797a261a2868b5512885d71bbf210?rik=ElIOP9nIAQYgwQ&riu=http%3a%2f%2fwww.cvcc.net.cn%2fPublic%2fUploads%2farticle%2f58083d9741fa0.jpg&ehk=gXhsxcnG%2bMGhPetS5bwW2gmHvXTOR8fiFgmlD4VbW4I%3d&risl=&pid=ImgRaw&r=0',
                  fit: BoxFit.fill),
            ),
          ),
        ]),
      ),
      Container(
        height: 44,
        width: 375,
        color: Colors.white,
        child: Stack(children: [
          new Positioned(
            top: 11.0,
            left: 26.0,
            child: Container(
              height: 44.0,
              width: 416.0,
              child: new Text('Lu.lab训练营能学到什么',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          new Positioned(
            top: 48.0,
            right: 16.0,
            child: Container(
              height: 22.0,
              width: 80.0,
              child:
                  new Text('查看更多', style: TextStyle(color: Colors.grey[600])),
            ),
          ),
        ]),
      ),
      Container(
        height: 339,
        width: 349,
        color: Colors.grey,
        margin: EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 36.0),
        // padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
        // decoration: new BoxDecoration(
        //     //容器背景装饰设置
        //     gradient: const LinearGradient(
        //         colors: [Colors.grey, Colors.grey, Colors.grey]),
        //     border: Border.all(width: 26.0, color: Colors.white) //容器外边框的设计
        //     ),
        child: Stack(children: [
          new Positioned(
            top: 11.0,
            left: 26.0,
            child: Container(
              height: 41.0,
              width: 72.0,
              color: Colors.orange,
            ),
          ),
          new Positioned(
            top: 11.0,
            left: 120.0,
            child: Container(
                height: 86.0,
                width: 230.0,
                child: new Text(
                    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                    textAlign: TextAlign.left,
                    maxLines: 3)),
          ),
          new Positioned(
            top: 79.0,
            left: 26.0,
            child: Container(
              height: 41.0,
              width: 72.0,
              color: Colors.orange,
            ),
          ),
          new Positioned(
            top: 79.0,
            left: 120.0,
            child: Container(
                height: 86.0,
                width: 230.0,
                child: new Text(
                    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                    textAlign: TextAlign.left,
                    maxLines: 3)),
          ),
        ]),
      ),
      Container(
        height: 44,
        width: 375,
        color: Colors.white,
        child: Stack(children: [
          new Positioned(
            top: 11.0,
            left: 13.0,
            child: Container(
              height: 44.0,
              width: 152.0,
              child: new Text(
                '校友反馈',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
      Container(
        height: 370,
        width: 375,
        color: Colors.white,
        child: Stack(children: [
          new Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
                height: 234.0,
                width: 722.0,
                margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
                child: Stack(
                  children: [
                    new Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                        height: 117.0,
                        width: 91.0,
                        child: new Image.network(
                            'https://tse2-mm.cn.bing.net/th/id/OIP-C.TZO9AzG-htzqracYB28R5AAAAA?w=157&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                            fit: BoxFit.fill),
                      ),
                    ),
                    new Positioned(
                      top: 12.0,
                      left: 140.0,
                      child: Opacity(
                        opacity: 1,
                        child: Container(
                          color: Colors.red[800],
                          height: 11.0,
                          width: 118.0,
                          child: new Text('Lu.labXX级功勋学员',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    new Positioned(
                      top: 29.0,
                      left: 150.0,
                      child: Container(
                        height: 16.0,
                        width: 28.0,
                        child: new Text('XX',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    new Positioned(
                      top: 29.0,
                      left: 190.0,
                      child: new Text('XXXXXX高管',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    new Positioned(
                      top: 53.0,
                      left: 140.0,
                      child: Container(
                        height: 50.0,
                        width: 241.0,
                        child: new Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                )),
          ),
          new Positioned(
            top: 124.0,
            left: 0.0,
            child: Container(
                height: 234.0,
                width: 722.0,
                margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
                child: Stack(
                  children: [
                    new Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                        height: 117.0,
                        width: 91.0,
                        child: new Image.network(
                            'https://tse2-mm.cn.bing.net/th/id/OIP-C.TZO9AzG-htzqracYB28R5AAAAA?w=157&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                            fit: BoxFit.fill),
                      ),
                    ),
                    new Positioned(
                      top: 12.0,
                      left: 140.0,
                      child: Opacity(
                        opacity: 1,
                        child: Container(
                          color: Colors.red[800],
                          height: 11.0,
                          width: 118.0,
                          child: new Text('Lu.labXX级功勋学员',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    new Positioned(
                      top: 29.0,
                      left: 150.0,
                      child: Container(
                        height: 16.0,
                        width: 28.0,
                        child: new Text('XX',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    new Positioned(
                      top: 29.0,
                      left: 190.0,
                      child: new Text('XXXXXX高管',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    new Positioned(
                      top: 53.0,
                      left: 140.0,
                      child: Container(
                        height: 50.0,
                        width: 241.0,
                        child: new Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                )),
          ),
          new Positioned(
            top: 250.0,
            left: 0.0,
            child: Container(
                height: 234.0,
                width: 722.0,
                margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
                child: Stack(
                  children: [
                    new Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                        height: 117.0,
                        width: 91.0,
                        child: new Image.network(
                            'https://tse2-mm.cn.bing.net/th/id/OIP-C.TZO9AzG-htzqracYB28R5AAAAA?w=157&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                            fit: BoxFit.fill),
                      ),
                    ),
                    new Positioned(
                      top: 12.0,
                      left: 140.0,
                      child: Opacity(
                        opacity: 1,
                        child: Container(
                          color: Colors.red[800],
                          height: 11.0,
                          width: 118.0,
                          child: new Text('Lu.labXX级功勋学员',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    new Positioned(
                      top: 29.0,
                      left: 150.0,
                      child: Container(
                        height: 16.0,
                        width: 28.0,
                        child: new Text('XX',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    new Positioned(
                      top: 29.0,
                      left: 190.0,
                      child: new Text('XXXXXX高管',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    new Positioned(
                      top: 53.0,
                      left: 140.0,
                      child: Container(
                        height: 50.0,
                        width: 241.0,
                        child: new Text(
                            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                )),
          ),
        ]),
      ),
      Container(
        height: 44,
        width: 375,
        color: Colors.white,
        child: Stack(children: [
          new Positioned(
            top: 11.0,
            left: 13.0,
            child: Container(
              height: 44.0,
              width: 152.0,
              child: new Text(
                '谁为你服务',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
      Container(
        height: 300,
        width: 375,
        color: Colors.white,
        child: Stack(children: [
          new Positioned(
            top: 0.0,
            left: 15.0,
            child: Container(
              height: 120.0,
              width: 90.0,
              child: new Image.network(
                  'https://tse2-mm.cn.bing.net/th/id/OIP-C.TZO9AzG-htzqracYB28R5AAAAA?w=157&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                  fit: BoxFit.fill),
            ),
          ),
          new Positioned(
            top: 12.0,
            left: 150.0,
            child: Opacity(
              opacity: 1,
              child: Container(
                color: Colors.red[800],
                height: 11.0,
                width: 118.0,
                child: new Text('Lu.lab创始人兼CEO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
          new Positioned(
            top: 29.0,
            left: 190.0,
            child: new Text('陆向谦',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          new Positioned(
            top: 53.0,
            left: 140.0,
            child: Container(
              height: 80.0,
              width: 200.0,
              child:
                  new Text('清华大学经管学院课程教授；教育部大学生创业培训指导委员会专家；美国加州伯克利大学Hass商学院博士。',
                      textAlign: TextAlign.left,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )),
            ),
          ),
          new Positioned(
            top: 140.0,
            left: 15.0,
            child: Container(
                height: 75.0,
                width: 166.0,
                child: new Image.network(
                    'https://tse1-mm.cn.bing.net/th/id/OIP-C.qCsD0PozvzJDgYmf78CaMgHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                    fit: BoxFit.fill)),
          ),
          new Positioned(
            top: 219.0,
            left: 20.0,
            child: Container(
              height: 36.0,
              width: 96.0,
              child: new Text(
                '杨仕明',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          new Positioned(
            top: 243.0,
            left: 20.0,
            child: Container(
              height: 28.0,
              width: 186.0,
              child: new Text(
                'Lu.lab产品负责人',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[350],
                ),
              ),
            ),
          ),
          new Positioned(
            top: 140.0,
            right: 20.0,
            child: Container(
                height: 75.0,
                width: 166.0,
                child: new Image.network(
                    'https://tse1-mm.cn.bing.net/th/id/OIP-C.qCsD0PozvzJDgYmf78CaMgHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                    fit: BoxFit.fill)),
          ),
          new Positioned(
            top: 219.0,
            left: 225.0,
            child: Container(
              height: 36.0,
              width: 96.0,
              child: new Text(
                '张晨',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          new Positioned(
            top: 243.0,
            left: 225.0,
            child: Container(
              height: 28.0,
              width: 186.0,
              child: new Text(
                'Lu.lab营销负责人',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[350],
                ),
              ),
            ),
          ),
        ]),
      ),
      Container(
        height: 44,
        width: 375,
        color: Colors.white,
        child: Stack(children: [
          new Positioned(
            top: 11.0,
            left: 13.0,
            child: Container(
              height: 44.0,
              width: 152.0,
              child: new Text(
                '常见问题',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
      Container(
          height: 200,
          width: 375,
          color: Colors.white,
          child: Stack(
            children: [
              new Positioned(
                  top: 10.0,
                  left: 22.0,
                  child: Text(
                    '1、什么时间可以报名？学习多长时间？',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              new Positioned(
                  top: 50.0,
                  left: 22.0,
                  child: Container(
                      height: 86,
                      width: 319,
                      child: Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                      ))),
            ],
          )),
      // Container(
      //   height: 84,
      //   width: 654,
      //   margin: const EdgeInsets.fromLTRB(48.0, 0.0, 48.0, 0.0),
      //   color: Colors.orange,
      //   child: new Text(
      //     '添加招生顾问 咨询报名',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       fontSize: 18.0,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      // Container(
      //     height: 444,
      //     width: 750,
      //     child: Stack(children: [
      //       new Positioned(
      //           top: 88,
      //           left: 108,
      //           child: Container(
      //               height: 48,
      //               width: 276,
      //               color: Colors.grey,
      //               child: new Text(
      //                 '毕业学生',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 15.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ))),
      //       new Positioned(
      //           top: 160,
      //           left: 108,
      //           child: Container(
      //               height: 74,
      //               width: 276,
      //               child: new Text(
      //                 'xxxx',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 32.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ))),
      //       new Positioned(
      //           top: 88,
      //           right: 74,
      //           child: Container(
      //               height: 48,
      //               width: 276,
      //               color: Colors.grey,
      //               child: new Text(
      //                 '毕业学生',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 15.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ))),
      //       new Positioned(
      //           top: 160,
      //           right: 74,
      //           child: Container(
      //               height: 74,
      //               width: 276,
      //               child: new Text(
      //                 'xxxx',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 32.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ))),
      //       new Positioned(
      //           top: 266,
      //           left: 108,
      //           child: Container(
      //               height: 48,
      //               width: 276,
      //               color: Colors.grey,
      //               child: new Text(
      //                 '毕业学生',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 15.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ))),
      //       new Positioned(
      //           top: 338,
      //           left: 108,
      //           child: Container(
      //               height: 74,
      //               width: 276,
      //               child: new Text(
      //                 'xxxx',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 32.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ))),
      //       new Positioned(
      //           top: 266,
      //           right: 74,
      //           child: Container(
      //               height: 48,
      //               width: 276,
      //               color: Colors.grey,
      //               child: new Text(
      //                 '毕业学生',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 15.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ))),
      //       new Positioned(
      //           top: 338,
      //           right: 74,
      //           child: Container(
      //               height: 74,
      //               width: 276,
      //               child: new Text(
      //                 'xxxx',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 32.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ))),
      //     ])),

      Container(
          height: 70,
          width: 50,
          color: Colors.white,
          child: new Image.asset('assets/image/logo白文.jpg')),
      Container(
          height: 46,
          width: 238,
          color: Colors.white,
          child: new Text(
            'Lu.lab训练营',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          )),
      ElevatedButton(
        child: Text(
          '戳此立即报名',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ), //child：可以放入容器，图标，文字。让你构建多彩的按钮。
        onPressed: () {},
      ),

      // child: Stack(
      //   children: [
      //     new Positioned(
      //         top: 88,
      //         left: 108,
      //         child: Stack(
      //           children: [
      //             new Positioned(
      //                 top: 0.0,
      //                 left: 0.0,
      //                 child: Container(
      //                     height: 178,
      //                     width: 276,
      //                     color: Colors.grey,
      //                     child: Text(
      //                       '毕业学生',
      //                       textAlign: TextAlign.center,
      //                       style: TextStyle(
      //                         fontSize: 13.0,
      //                       ),
      //                     ))),
      //             new Positioned(
      //                 top: 48,
      //                 left: 0,
      //                 child: Container(
      //                   height: 130,
      //                   width: 276,
      //                   child: Text(
      //                     'XXXX',
      //                     textAlign: TextAlign.center,
      //                     style: TextStyle(
      //                       fontSize: 32.0,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 )),
      //           ],
      //         )),
      //   ],
      // )),
      // Container(
      //   height: 1424,
      //   width: 750,
      //   color: Colors.white,
      //   child: Stack(children: [
      //     new Positioned(
      //         top: 58.0,
      //         left: 40.0,
      //         child: Stack(children: [
      //           new Positioned(
      //             top: 0.0,
      //             left: 4.0,
      //             child: Container(
      //               height: 36.0,
      //               width: 562.0,
      //               child: new Text(
      //                 '什么时间可以报名？学习多长时间？',
      //                 style: TextStyle(
      //                   fontSize: 16.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           new Positioned(
      //             top: 42.0,
      //             left: 28.0,
      //             child: Container(
      //               height: 214.0,
      //               width: 666.0,
      //               child: new Text(
      //                 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      //                 textAlign: TextAlign.left,
      //                 maxLines: 5,
      //                 style: TextStyle(
      //                   fontSize: 13.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //           )
      //         ])),
      //     // new Positioned(
      //     //     top: 272.0,
      //     //     left: 42.0,
      //     //     child: Stack(children: [
      //     //       new Positioned(
      //     //         top: 0.0,
      //     //         left: 4.0,
      //     //         child: Container(
      //     //           height: 36.0,
      //     //           width: 562.0,
      //     //           child: new Text(
      //     //             '什么时间可以报名？学习多长时间？',
      //     //             style: TextStyle(
      //     //               fontSize: 16.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       ),
      //     //       new Positioned(
      //     //         top: 42.0,
      //     //         left: 28.0,
      //     //         child: Container(
      //     //           height: 214.0,
      //     //           width: 666.0,
      //     //           child: new Text(
      //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      //     //             textAlign: TextAlign.left,
      //     //             maxLines: 5,
      //     //             style: TextStyle(
      //     //               fontSize: 13.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       )
      //     //     ])),
      //     // new Positioned(
      //     //     top: 486.0,
      //     //     left: 40.0,
      //     //     child: Stack(children: [
      //     //       new Positioned(
      //     //         top: 0.0,
      //     //         left: 4.0,
      //     //         child: Container(
      //     //           height: 36.0,
      //     //           width: 562.0,
      //     //           child: new Text(
      //     //             '什么时间可以报名？学习多长时间？',
      //     //             style: TextStyle(
      //     //               fontSize: 16.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       ),
      //     //       new Positioned(
      //     //         top: 42.0,
      //     //         left: 28.0,
      //     //         child: Container(
      //     //           height: 214.0,
      //     //           width: 666.0,
      //     //           child: new Text(
      //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      //     //             textAlign: TextAlign.left,
      //     //             maxLines: 5,
      //     //             style: TextStyle(
      //     //               fontSize: 13.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       )
      //     //     ])),
      //     // new Positioned(
      //     //     top: 700.0,
      //     //     left: 40.0,
      //     //     child: Stack(children: [
      //     //       new Positioned(
      //     //         top: 0.0,
      //     //         left: 4.0,
      //     //         child: Container(
      //     //           height: 36.0,
      //     //           width: 562.0,
      //     //           child: new Text(
      //     //             '什么时间可以报名？学习多长时间？',
      //     //             style: TextStyle(
      //     //               fontSize: 16.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       ),
      //     //       new Positioned(
      //     //         top: 42.0,
      //     //         left: 28.0,
      //     //         child: Container(
      //     //           height: 214.0,
      //     //           width: 666.0,
      //     //           child: new Text(
      //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      //     //             textAlign: TextAlign.left,
      //     //             maxLines: 5,
      //     //             style: TextStyle(
      //     //               fontSize: 13.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       )
      //     //     ])),
      //     // new Positioned(
      //     //     top: 914.0,
      //     //     left: 40.0,
      //     //     child: Stack(children: [
      //     //       new Positioned(
      //     //         top: 0.0,
      //     //         left: 4.0,
      //     //         child: Container(
      //     //           height: 36.0,
      //     //           width: 562.0,
      //     //           child: new Text(
      //     //             '什么时间可以报名？学习多长时间？',
      //     //             style: TextStyle(
      //     //               fontSize: 16.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       ),
      //     //       new Positioned(
      //     //         top: 42.0,
      //     //         left: 28.0,
      //     //         child: Container(
      //     //           height: 214.0,
      //     //           width: 666.0,
      //     //           child: new Text(
      //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      //     //             textAlign: TextAlign.left,
      //     //             maxLines: 5,
      //     //             style: TextStyle(
      //     //               fontSize: 13.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       )
      //     //     ])),
      //     // new Positioned(
      //     //     top: 1128.0,
      //     //     left: 40.0,
      //     //     child: Stack(children: [
      //     //       new Positioned(
      //     //         top: 0.0,
      //     //         left: 4.0,
      //     //         child: Container(
      //     //           height: 36.0,
      //     //           width: 562.0,
      //     //           child: new Text(
      //     //             '什么时间可以报名？学习多长时间？',
      //     //             style: TextStyle(
      //     //               fontSize: 16.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       ),
      //     //       new Positioned(
      //     //         top: 42.0,
      //     //         left: 28.0,
      //     //         child: Container(
      //     //           height: 214.0,
      //     //           width: 666.0,
      //     //           child: new Text(
      //     //             'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      //     //             textAlign: TextAlign.left,
      //     //             maxLines: 5,
      //     //             style: TextStyle(
      //     //               fontSize: 13.0,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       )
      //     //     ])),
      //   ]),
      // )
    ]);
  }
}
