// import 'package:flutter/material.dart';
// import '../../common/staticdata/json_data.dart';
//
// import '../../common/entitys/entitys.dart';
// import '../../common/utils/utils.dart';
//
// import 'home_product_detail.dart';
//
// class Product extends StatefulWidget {
//   const Product({Key? key}) : super(key: key);
//
//   @override
//   State<Product> createState() => _ProductState();
// }
//
// class _ProductState extends State<Product> {
//   late Train _postsDataProduct;
//
//   @override
//   void initState() {
//     super.initState();
//     _postsDataProduct = Train.fromJson(Jsondata.product);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _postsDataProduct.data.product.length,
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           child: Container(
//             margin: const EdgeInsets.all(10),
//             alignment: Alignment.topLeft,
//             width: 1.sw,
//             height: 200,
//             child: Column(
//               children: [
//                 Container(
//                   width: 1.sw,
//                   height: 180,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 10),
//                       Container(
//                         width: 340,
//                         height: 100,
//
//                         child: Container(
//                           width: 1.sw,
//                           height: 180,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                   flex: 1,
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         alignment: Alignment.center,
//                                         height: 50,
//                                         child: Text(
//                                           _postsDataProduct
//                                               .data.product[index].name,
//                                         ),
//                                       ),
//                                       Container(
//                                         alignment: Alignment.center,
//                                         height: 50,
//                                         child: Text(
//                                           _postsDataProduct
//                                               .data.product[index].description,
//                                         ),
//                                       )
//                                     ],
//                                   )),
//                               Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: NetworkImage(
//                                           _postsDataProduct
//                                               .data.product[index].img,
//                                         ), // 图片数组
//                                         fit: BoxFit.fill,
//                                       ),
//                                       borderRadius: const BorderRadius.only(
//                                         topRight: Radius.circular(10),
//                                       ),
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                         // Image.network(
//                         //   'https://img2.baidu.com/it/u=295131672,1212858880&fm=253&fmt=auto&app=138&f=JPEG?w=325&h=200',
//                         //   fit: BoxFit.fill,
//                         //   width: 400,
//                         // ),
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10)),
//                           color: Colors.red,
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(10.0),
//                         child: Row(
//                           children: <Widget>[
//                             Expanded(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 50,
//                                 child: const Text('特点1'),
//                               ),
//                             ),
//                             Container(
//                               width: 1,
//                               color: Colors.black,
//                             ),
//                             Expanded(
//                                 flex: 1,
//                                 child: SizedBox(
//                                     height: 50,
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       height: 50,
//                                       child: const Text(' 特点2'),
//                                     ))),
//                             Container(
//                               width: 1,
//                               color: Colors.black,
//                             ),
//                             Expanded(
//                                 flex: 1,
//                                 child: SizedBox(
//                                     height: 50,
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       height: 50,
//                                       child: const Text(' 特点3'),
//                                     ))),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   //Image.network(
//                   //   _postsDataProduct.data.product[index].img,
//                   //   fit: BoxFit.contain,
//                   //   height: 100,
//                   //   width: 100,
//                   // ),
//                 ),
//               ],
//             ),
//             decoration: BoxDecoration(
// //背景
//               color: Colors.white,
//               //设置四周圆角 角度
//               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//               //设置四周边框
//               border: Border.all(width: 1, color: Colors.white),
//             ),
//           ),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ProductDetail(
//                   product: _postsDataProduct.data.product[index],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
/*
 * @Author: 21克的爱情
 * @Date: 2020-04-28 16:50:26
 * @Email: raohong07@163.com
 * @LastEditors: 21克的爱情
 * @LastEditTime: 2021-02-04 19:46:06
 * @Description:
 */

import 'dart:async';

import 'package:alarm_calendar/alarm_calendar_plugin.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Calendars calendars = new Calendars(
      new DateTime.now(),
      new DateTime.now().add(new Duration(days: 1)),
      '测试通知',
      '测试通知描述',
      [5],
      '1',
      1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text('创建日程'),
                onPressed: () {
                  createEvent(calendars);
                },
              ),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text('获取日程'),
                onPressed: () {
                  selectEvent(calendars.getEventId);
                },
              ),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text('修改日程'),
                onPressed: () async {
                  calendarsInit();
                  final id = await AlarmCalendar.updateEvent(calendars);
                  print("修改日程ID为：$id");
                  calendars.setEventId = id!;
                },
              ),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text('删除日程'),
                onPressed: () async {
                  final status =
                      await AlarmCalendar.deleteEvent(calendars.getEventId);
                  print("删除状态：$status");
                  calendars.setEventId = '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calendarsInit() {
    //更新参数
    calendars.setTitle = '测试通知修改版';
    calendars.setAlert = [3, 15];
    calendars.setStartTime = new DateTime.now();
    calendars.setEndTime = new DateTime.now().add(new Duration(days: 2));
    calendars.setAllDay = 0;
    calendars.setNote = '这里是备注内容';
  }

  Future<void> createEvent(Calendars calendars) async {
    //查询是否有读权限。
    await AlarmCalendar.CheckReadPermission().then((res) async {
      if (res != null) {
        //查询是否有写权限
        await AlarmCalendar.CheckWritePermission().then((resWrite) async {
          if (resWrite != null) {
            final id = await AlarmCalendar.createEvent(calendars);
            calendars.setEventId = id!;
            print('获得ID为：' + id);
          }
        });
      }
    });
  }

  Future<void> selectEvent(String id) async {
    //查询是否有读权限。
    await AlarmCalendar.CheckReadPermission().then((res) async {
      if (res != null) {
        //查询是否有写权限
        await AlarmCalendar.CheckWritePermission().then((resWrite) async {
          if (resWrite != null) {
            final result = await AlarmCalendar.selectEvent(id);
            print('获取返回数据：$result');
          }
        });
      }
    });
  }
}
