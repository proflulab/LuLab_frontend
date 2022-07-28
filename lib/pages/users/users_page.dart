import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

import '/pages/users/users_set_user.dart';
import 'notice_page.dart';
import 'users_set.dart';
import '../sign_in/login_phone.dart';
import 'package:get/get.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
//print(profile.img);
    //获取屏幕宽度、高度
    //double screenwidth = MediaQuery.of(context).size.width;
    //double screenheight = MediaQuery.of(context).size.height;
//个人头像，姓名，等级
    Widget _username() {
      return Container(
        //height: 100,
        margin: const EdgeInsets.all(20),
        //color: Colors.white,
        child: ListTile(
          leading: SizedBox(
              width: 100.w,
              height: 100.w,
              child: ClipOval(
                  child: CachedImage.typeLaod(Global.profile.imgUrl!))),
          title: Text(
            Global.profile.name!,
            style: const TextStyle(
              fontFamily: 'MyFontStyle',
              color: Colors.black,
              fontSize: 28,
            ),
          ),
          subtitle: const Text(
            "功勋学员",
            style: TextStyle(
              fontFamily: 'MyFontStyle',
              color: Colors.green,
              fontSize: 14,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          trailing: const Text(
            "个人主页",
            style: TextStyle(
              fontFamily: 'MyFontStyle',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {
            if (kDebugMode) {
              print("进入个人主页");
            }
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const SetUser()));
          },
        ),
      );
    }

    Widget _login() {
      return Column(
        children: [
          Container(
            height: 20,
          ),
          Center(
            child: Container(
              //margin: EdgeInsets.all(PFspace.screenMargin),
              // color: Colors.blue,
              width: 190,
              height: 30,
              child: MaterialButton(
                  child: const Text(
                    '登录/注册',
                  ),
                  onPressed: () {
                    Get.to(PhoneLogin());
                  }
                  //
                  ),
              decoration: const BoxDecoration(
//背景
                color: Colors.orange,
                //设置四周圆角 角度
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                //设置四周边框
              ),
            ),
          ),
          Container(
            height: 8,
          ),
          const Center(
            child: Text(
              "登录/注册可解锁完整功能",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          )
        ],
      );
    }

    // Widget _dynamicdata() {
    //   return SizedBox(
    //     height: 60,
    //     width: screenwidth,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         ContactItem(
    //           count: '56',
    //           title: '动态',
    //           onPressed: () {},
    //         ),
    //         ContactItem(
    //           count: '78',
    //           title: '关注',
    //           onPressed: () {},
    //         ),
    //         ContactItem(
    //           count: '90',
    //           title: '粉丝',
    //           onPressed: () {},
    //         ),
    //         ContactItem(
    //           count: '12min',
    //           title: '累计学习',
    //           onPressed: () {},
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // Widget _adv() {
    //   return Container(
    //     height: 90,
    //     padding: const EdgeInsets.only(left: 15, right: 5),
    //     margin: const EdgeInsets.only(left: 30, right: 30),
    //     decoration: const BoxDecoration(
    //         shape: BoxShape.rectangle,
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(15),
    //           topRight: Radius.circular(15),
    //         ),
    //         color: Colors.green),
    //     child: Center(
    //       child: ListTile(
    //         title: const Text("VIP"),
    //         subtitle: const Text("优享&大特权"),
    //         contentPadding: const EdgeInsets.all(10),
    //         trailing: const Chip(
    //           avatar: null,
    //           label: Text("立即加入"),
    //         ),
    //         onTap: () {
    //           if (kDebugMode) {
    //             print("进入会员详情");
    //           }
    //         },
    //       ),
    //     ),
    //   );
    // }

    // Widget _jumpbutton() {
    //   return Container(
    //     height: 250,
    //     width: 500,
    //     //padding: EdgeInsets.only(left: 5, right: 5),
    //     margin: const EdgeInsets.only(left: 10, right: 10),
    //     decoration: const BoxDecoration(
    //         shape: BoxShape.rectangle,
    //         borderRadius: BorderRadius.all(Radius.circular(20)),
    //         color: Colors.white),
    //     child: Wrap(
    //       spacing: 0, // 主轴(水平)方向间距
    //       runSpacing: 20,
    //       direction: Axis.horizontal,
    //       alignment: WrapAlignment.spaceBetween,
    //       verticalDirection: VerticalDirection.down,
    //       children: [
    //         combotton(
    //             bottomname: " 购买记录",
    //             icon: const Icon(
    //               PFIcon.userBuy,
    //               size: 40,
    //               color: Colors.red,
    //             ),
    //             onPressed: () {
    //               if (kDebugMode) {
    //                 print("跳转到购买记录");
    //               }
    //             },
    //             context: context),
    //         combotton(
    //             bottomname: "离线课程",
    //             icon: const Icon(
    //               PFIcon.userDownload,
    //               size: 40,
    //               color: Colors.red,
    //             ),
    //             onPressed: () {},
    //             context: context),
    //         combotton(
    //             bottomname: "我的收藏",
    //             icon: const Icon(
    //               PFIcon.userCollect,
    //               size: 40,
    //               color: Colors.red,
    //             ),
    //             onPressed: () {},
    //             context: context),
    //         combotton(
    //             bottomname: "观看历史",
    //             icon: const Icon(
    //               PFIcon.userHistory,
    //               size: 40,
    //               color: Colors.red,
    //             ),
    //             onPressed: () {},
    //             context: context),
    //         combotton(
    //             bottomname: "我的会员",
    //             icon: const Icon(
    //               PFIcon.userVip,
    //               size: 40,
    //               color: Colors.red,
    //             ),
    //             onPressed: () {},
    //             context: context),
    //       ],
    //     ),
    //   );
    // }

    Widget _contact() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
        //padding: EdgeInsets.all(PFspace.screenMargin),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            lineWidget(
                left: const Icon(
                  PFIcon.userwee,
                  size: 26,
                  color: Colors.green,
                ),
                title: "邮箱咨询",
                onTap: () async {
                  // UrlLaucher.email('business@proflu.cn', 'This is a test email',
                  //     'This is a test email body');
                  Clipboard.setData(
                      const ClipboardData(text: "business@proflu.cn"));
                  toastInfo(msg: "已复制邮箱到剪切板");
                }),
            Divider(height: 1, indent: 30.w, endIndent: 30.w),
            lineWidget(
                left: const Icon(
                  PFIcon.userCooperation,
                  size: 26,
                  color: Colors.green,
                ),
                title: "联系我们",
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Browser(
                        url:
                            "https://work.weixin.qq.com/kfid/kfcf1c4876b71dc6e7a",
                        title: "联系我们",
                      ),
                    ),
                  );
                }),
            //在线咨询
            // const Divider(),
            // listtilebotton(
            //     bottomname: "在线咨询",
            //     icon: const Icon(
            //       PFIcon.userOnline,
            //       size: 30,
            //       color: Colors.red,
            //     ),
            //     onPressed: () {
            //       if (kDebugMode) {
            //         print("object");
            //       }
            //     },
            //     context: context),
            // const Divider(),
            // listtilebotton(
            //     bottomname: "帮助中心",
            //     icon: const Icon(
            //       PFIcon.userHelp,
            //       size: 30,
            //       color: Colors.green,
            //     ),
            //     onPressed: () {
            //       if (kDebugMode) {
            //         print("object");
            //       }
            //       ;
            //       showDialog<Null>(
            //         context: context,
            //         barrierDismissible: false,
            //         builder: (BuildContext context) {
            // return AlertDialog(
            //   // title: const Text('标题'),
            //   content: buildContent(context),
            //   actions: <Widget>[
            //     ElevatedButton(
            //       child: const Text('确定'),
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //     ),
            //   ],
            // );
            //           return CupertinoAlertDialog(
            //             content: const Text('具体咨询请致电：123456'),
            //             actions: <Widget>[
            //               CupertinoDialogAction(
            //                 child: const Text("确定"),
            //                 onPressed: () {
            //                   Navigator.of(context).pop();
            //                 },
            //               ),
            //             ],
            //           );
            //         },
            //       ).then((val) {
            //         print(val);
            //       });
            //     },
            //     context: context),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print("跳转到通知");
                print(Global.profile.id);
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoticePage(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print("跳转到设置");
              }
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage()));
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.green,
            ),
          ),
        ],
        // leading: IconButton(
        //   icon: const Icon(Icons.qr_code_scanner, color: Colors.green),
        //   onPressed: () {
        //     if (kDebugMode) {
        //       print("扫码");
        //     }
        //   },
        // ),
      ),
      body: ListView(
        children: <Widget>[
          Global.state == UserState.member ? _username() : _login(),
          // _dynamicdata(),
          // _adv(),
          // _jumpbutton(),
          const Divider(),
          _contact(),
        ],
      ),
    );
  }
}
