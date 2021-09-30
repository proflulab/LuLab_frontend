import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: '导航演示1', home: new FirstScreen() //这里的页面对应的是下面定义的第一个页面作为主界面
      ));
}

class FirstScreen extends StatelessWidget {
  get groupValue => null;

  set groupValue(Object? groupValue) {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(children: <Widget>[
      Container(
          width: 375.0, //容器的相关参数
          height: 45.0,
          color: Colors.white,
          child: Stack(
            children: [
              new Positioned(
                  top: 9,
                  left: 20,
                  child: new Text('用户名',
                      style: TextStyle(
                        fontSize: 13.0,
                      ))),
              new Positioned(
                  top: 30,
                  left: 10,
                  child: new Text('登录方式/账号信息',
                      style: TextStyle(
                        fontSize: 7.0,
                      ))),
              new Positioned(
                  top: 10,
                  right: 21,
                  child: RaisedButton(
                    child: Text('更换账号',
                        style: TextStyle(
                          fontSize: 13.0,
                        )), //child：可以放入容器，图标，文字。让你构建多彩的按钮。
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new SecondScreen()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
                          );
                    },
                  )),
            ],
          )),
      Container(
          width: 357.0, //容器的相关参数
          height: 185.0,
          color: Colors.white,
          child: Stack(
            children: [
              new Positioned(
                top: 19,
                left: 19,
                child: Container(
                    width: 175.0, //容器的相关参数
                    height: 114.0,
                    child: new Image.network(
                        'https://tse2-mm.cn.bing.net/th/id/OIP-C.vNu2wJHjXVaiBhEoUL6eDQHaET?w=280&h=180&c=7&r=0&o=5&pid=1.7') //容器内的文字，大小，颜色等参数
                    ),
              ),
              new Positioned(
                  top: 19,
                  right: 85,
                  child: new Text('课程名称',
                      style: TextStyle(
                        fontSize: 18.0,
                      ))),
              new Positioned(
                  top: 107,
                  right: 41,
                  child: new Text('期限：永久',
                      style: TextStyle(
                        fontSize: 14.0,
                      ))),
              new Positioned(
                  top: 157,
                  right: 22,
                  child: new Text('需支付：￥xxx.xx元',
                      style: TextStyle(fontSize: 16.0, color: Colors.red))),
            ],
          ) //容器内的文字，大小，颜色等参数
          ),
      Container(
        height: 192,
        width: 357,
        color: Colors.white,
        child: Stack(children: [
          new Positioned(
            top: 8.0,
            left: 10.0,
            child: new Text(
              '支付方式',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          new Positioned(
            top: 95.0,
            left: 21.0,
            child: const Icon(
              IconData(
                0xe68a,
                fontFamily: 'MyIcons支付宝',
              ),
              size: 49.0,
              color: Colors.blue,
            ),
          ),
          new Positioned(
            top: 56.0,
            left: 115.0,
            child: new Text(
              '微信支付',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          new Positioned(
            top: 50.0,
            left: 25.0,
            child: const Icon(
              IconData(
                0xe607,
                fontFamily: 'MyIcons微信',
              ),
              size: 40.0,
              color: Colors.green,
            ),
          ),
          new Positioned(
            top: 104.0,
            left: 105.0,
            child: new Text(
              '支付宝支付',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          new Positioned(
            top: 153.0,
            left: 105.0,
            child: new Text(
              '课程兑换券',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          new Positioned(
            top: 144.0,
            left: 21.0,
            child: const Icon(
              IconData(
                0xe616,
                fontFamily: 'MyIcons优惠券',
              ),
              size: 45.0,
              color: Colors.red,
            ),
          ),
          new Positioned(
            top: 56.0,
            right: 20.0,
            child: Radio(
              ///此单选框绑定的值 必选参数
              value: 0,

              ///当前组中这选定的值  必选参数
              groupValue: groupValue,

              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
          ),
          new Positioned(
            top: 104.0,
            right: 20.0,
            child: Radio(
              ///此单选框绑定的值 必选参数
              value: 0,

              ///当前组中这选定的值  必选参数
              groupValue: groupValue,

              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
          ),
          new Positioned(
            top: 153.0,
            right: 20.0,
            child: Radio(
              ///此单选框绑定的值 必选参数
              value: 0,

              ///当前组中这选定的值  必选参数
              groupValue: groupValue,

              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
          ),
        ]),
      ),
      Container(
        width: 359.0, //容器的相关参数
        height: 30.0,
        color: Colors.white,
        alignment: Alignment.center, //child在容器的位置
        child: new Text(
          '提交订单表示您同意',
          style: TextStyle(fontSize: 13.0),
        ), //容器内的文字，大小，颜色等参数
      ),
      Container(
          width: 359.0, //容器的相关参数
          height: 90.0,
          color: Colors.white,
          alignment: Alignment.center, //child在容器的位置
          child: Stack(children: [
            new Positioned(
              top: 153.0,
              right: 20.0,
              child: Radio(
                ///此单选框绑定的值 必选参数
                value: 0,

                ///当前组中这选定的值  必选参数
                groupValue: groupValue,

                ///点击状态改变时的回调 必选参数
                onChanged: (v) {
                  setState(() {
                    this.groupValue = v;
                  });
                },
              ),
            ),
            new Positioned(
                top: 8.0,
                left: 70.0,
                child: RaisedButton(
                  child: new Text(
                    '《陆向谦创新创业实验室用户服务协议》',
                    style: TextStyle(fontSize: 13.0, color: Colors.blue),
                  ), //child：可以放入容器，图标，文字。让你构建多彩的按钮。
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                new SecondScreen()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
                        );
                  },
                )),
          ]) //容器内的文字，大小，颜色等参数
          ),
      Container(
          width: 359.0, //容器的相关参数
          height: 40.0,
          color: Colors.lightBlue,
          alignment: Alignment.center, //child在容器的位置
          child: RaisedButton(
            child: new Text(
              '确认付款',
              style: TextStyle(fontSize: 13.0),
            ), //容器内的文字，大小，颜色等参数//child：可以放入容器，图标，文字。让你构建多彩的按钮。
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          new SecondScreen()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
                  );
            },
          )),
    ]));
  }

  void setState(Null Function() param0) {}
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('技术胖商品详情页')),
        body: Center(
            child: RaisedButton(
          child: Text('返回'),
          onPressed: () {
            Navigator.pop(context); //返回到上一个页面
          },
        )));
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//       title: '导航演示1', home: new RadioView() //这里的页面对应的是下面定义的第一个页面作为主界面
//       ));
// }

// class RadioView extends StatefulWidget {
//   @override
//   _RadioViewState createState() => _RadioViewState();
// }

// class _RadioViewState extends State<RadioView> {
//   int groupValue = 1;

//   onChange(value) {
//     if (mounted)
//       setState(() {
//         groupValue = value;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(
//           Icons.arrow_back,
//           size: 20,
//           color: Colors.yellow,
//         ),
//         actions: <Widget>[
//           Container(
//             margin: EdgeInsets.only(right: 10),
//             child: Icon(Icons.android),
//           )
//         ],
//         centerTitle: true,
//         title: Text(
//           "Hello world!",
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               fontStyle: FontStyle.italic),
//         ),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               Row(
//                 ///主轴（x）
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Radio(
//                     ///给单选按钮设置一个标签（名字），方便知道选中是哪一个
//                     value: 1,

//                     ///当前选中的按钮的标签
//                     groupValue: groupValue,

//                     ///监听用户操作事件，选中了哪一个，T就是value标签值
//                     onChanged: (T) => onChange(T),
//                   ),
//                   Radio(
//                     value: 2,
//                     groupValue: groupValue,
//                     onChanged: (T) => onChange(T),
//                   ),
//                   Radio(
//                     value: 3,
//                     groupValue: groupValue,
//                     onChanged: (T) => onChange(T),
//                   ),
//                 ],
//               ),
//               Text("当前选中的radio的value==>$groupValue"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// TODO Implement this library.