// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'login_page.dart';
// //import 'password_login.dart';
// import 'phone_login.dart';
// import '../sign_up/register.dart';
// import 'sign_in.dart';

// //微信登录，手机一键登录
// class Login1 extends StatelessWidget {
//   const Login1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Login(),
//     );
//   }
// }

// class Login extends StatelessWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           // logo
//           Container(
//             height: 100,
//             width: 100,
//             // 上边距
//             margin: const EdgeInsetsDirectional.only(top: 100),
//             child: const Center(
//               // logo 文本
//               child: Text(
//                 "陆向谦实验室",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             decoration: BoxDecoration(
//               // logo 背景色
//               color: const Color(0xff2a67fe),
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           // 微信登录
//           Container(
//             width: 350,
//             height: 40,
//             // 上边距
//             margin: const EdgeInsets.only(top: 200),
//             child: ElevatedButton(
//               style: ButtonStyle(
//                   // 微信登录边框
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                   ),
//                   // 背景颜色
//                   backgroundColor:
//                       MaterialStateProperty.all(const Color(0xff2a67fe))),
//               child: const Text(
//                 // 文本颜色
//                 "微信登录",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               onPressed: () {
//                 if (kDebugMode) {
//                   print("微信登录");
//                 }
//               },
//             ),
//           ),
//           // 手机号登录
//           Container(
//             width: 350,
//             height: 40,
//             // 上边距
//             margin: const EdgeInsets.only(top: 25),
//             child: ElevatedButton(
//               // 边框
//               style: ButtonStyle(
//                   shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20))),
//                   backgroundColor:
//                       // 背景颜色
//                       MaterialStateProperty.all(const Color(0xffeaeeff))),
//               child: const Text(
//                 // 文本颜色
//                 "手机号一键登录",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xff2c6eff),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => const LoginPage()));
//               },
//             ),
//           ),
//           // 左右链接
//           Container(
//             width: 350,
//             height: 40,
//             // 上边距
//             margin: const EdgeInsets.only(top: 50),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   child:
//                       const Text("验证码登录", style: TextStyle(color: Color(0xff8a8a8a))),
//                   onPressed: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => const PhoneLogin1()));
//                   },
//                 ),
//                 TextButton(
//                     child: const Text("账号密码登录",
//                         style: TextStyle(color: Color(0xff8a8a8a))),
//                     onPressed: () {
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //     builder: (context) => VerifyCodeLogin1()));
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const SignInPage()));
//                     }),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const SignUpPage()));
//                     },
//                     child: const Text('点我注册',
//                         style: TextStyle(color: Color(0xff8a8a8a))))
//               ],
//             ),
//           ),
//           // 其他登录方式
//           Container(
//             width: 350,
//             height: 40,
//             // 上边距
//             margin: const EdgeInsets.only(top: 30),
//             child: const Text(
//               "其他登录方式",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xffadadad),
//               ),
//             ),
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             // TextButton(
//             //   child: Image.asset(
//             //     'assets/images/微信.png',
//             //     height: 24,
//             //     width: 24,
//             //   ),
//             //   autofocus: true,
//             //   style: ButtonStyle(
//             //     backgroundColor: MaterialStateProperty.all(Colors.white),
//             //     shape: MaterialStateProperty.all(StadiumBorder()),
//             //     minimumSize: MaterialStateProperty.all(Size(36, 36)),
//             //     side: MaterialStateProperty.all(
//             //         BorderSide(color: Colors.grey, width: 1)),
//             //   ),
//             //   onPressed: () {},
//             // ),
//             // const SizedBox(
//             //   width: 40.0,
//             // ),
//             TextButton(
//               child: Image.asset(
//                 'assets/images/QQ.png',
//                 height: 24,
//                 width: 24,
//               ),
//               autofocus: true,
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.white),
//                 shape: MaterialStateProperty.all(const StadiumBorder()),
//                 minimumSize: MaterialStateProperty.all(const Size(36, 36)),
//                 side: MaterialStateProperty.all(
//                     const BorderSide(color: Colors.grey, width: 1)),
//               ),
//               onPressed: () {},
//             ),
//             const SizedBox(
//               width: 40.0,
//             ),
//             TextButton(
//               child: Image.asset(
//                 'assets/images/微博.png',
//                 height: 24,
//                 width: 24,
//               ),
//               autofocus: true,
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.white),
//                 shape: MaterialStateProperty.all(const StadiumBorder()),
//                 minimumSize: MaterialStateProperty.all(const Size(36, 36)),
//                 side: MaterialStateProperty.all(
//                     const BorderSide(color: Colors.grey, width: 1)),
//               ),
//               onPressed: () {},
//             ),
//           ]),
//           // 协议
//           const ProtocolButtonWidget(),
//         ],
//       ),
//     );
//   }
// }
