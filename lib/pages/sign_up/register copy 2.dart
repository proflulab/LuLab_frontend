import 'package:flutter/material.dart';
//import '../sign_in/phone_login.dart';

class TextFieldDemo1 extends StatelessWidget {
  const TextFieldDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextFieldDemo(),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 180,
          ),
          PhoneWidget(),
          SizedBox(
            height: 40,
          ),
          PasswordWidget(),
          SizedBox(
            height: 40,
          ),
          PasswordWidget(),
          SizedBox(
            height: 40,
          ),
          _button()
        ],
      ),
    );
  }
}

// 账号
class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 300,
        child: TextField(
          textAlign: TextAlign.center,
          autofocus: true,
          style: TextStyle(
            color: Color(0x9CFF0000),
          ),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            fillColor: Color(0xBEB8B8B8),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x00FF0000)),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x00FF0000)),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            hintText: "账号",
            //hintStyle:,
          ),
        ));
  }
}

// 密码
class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password_sharp),
        hintText: "请输入密码",
      ),
    );
  }
}

// 注册
// Widget _buildRegister() {
//   return Container(
//     width: 200,
//     height: 50,
//     child: ElevatedButton(
//       onPressed: () {},
//       child: Text(
//         "注册",
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 20,
//           textBaseline: TextBaseline.alphabetic,
//         ),
//       ),
//     ),
//   );
// }

Widget _button() {
  return Container(
    width: 200,
    height: 40,
    child: RawMaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 5,
      highlightElevation: 0,
      fillColor: Colors.blue,
      splashColor: Colors.orange,
      textStyle: TextStyle(
        fontSize: 20,
        textBaseline: TextBaseline.alphabetic,
      ),
      onLongPress: () {
        print('onLongPress');
      },
      child: Text("注册"),
      onPressed: () => print('onPressed'),
    ),
  );
}
