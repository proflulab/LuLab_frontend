import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../values/values.dart';
import '../../widget/widgets.dart';
import '../../entitys/entitys.dart';
import '../../api/apis.dart';
import '../../global.dart';

class SetUser extends StatefulWidget {
  SetUser({Key? key}) : super(key: key);
  @override
  _SetUserState createState() => _SetUserState();
}

class _SetUserState extends State<SetUser> {
  String _sexValue = Global.profile.data.sex;
  final TextEditingController _nameController =
      TextEditingController(text: Global.profile.data.name);
  final TextEditingController _introController =
      TextEditingController(text: Global.profile.data.description);
  final TextEditingController _phoneController =
      TextEditingController(text: Global.profile.data.phone);
  final TextEditingController _wechatnameController =
      TextEditingController(text: Global.profile.data.wechat);

// 执行修改个人信息操作
  _carryUp() async {
    UserUpdaterequest variables = UserUpdaterequest(
      name: _nameController.value.text,
      password: "12345678",
      description: _introController.value.text,
      img:
          'http://img.wxcha.com/m00/f0/f5/5e3999ad5a8d62188ac5ba8ca32e058f.jpg',
      phone: _phoneController.value.text,
      sex: _sexValue,
      wechat: _wechatnameController.value.text,
    );
    try {
      await GqlUserAPI.userup(context: context, variables: variables);

      toastInfo(msg: '修改成功');
    } catch (e) {
      if (kDebugMode) {
        print("打印错误信息");
      }
      if (kDebugMode) {
        print(e);
      }
      return toastInfo(msg: '修改失败，数据上传出错！');
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '个人信息',
          ),
          actions: [
            Center(
                child: InkWell(
              child: const Text("保存"),
              onTap: () {
                _carryUp();
                if (kDebugMode) {
                  print("保存个人信息");
                }
              },
            ))
          ],
        ),
        body: Column(
          children: [
            listGroup2(
              context: context,
              title: '头像',
              child: ClipOval(child: Image.network(Global.profile.data.img)),
              icon: const Icon(MyIcon.user_right),
              onTap: () {
                if (kDebugMode) {
                  print("该功能未开发，当前无法更改");
                }
                toastInfo(msg: '功能未开发，当前无法修改');
              },
            ),
            const Divider(),
            listGroup1(
                context: context, title: '姓名', textController: _nameController),
            const Divider(),
            listGroup1(
                context: context,
                title: '简介',
                textController: _introController),
            const Divider(),
            listGroup1(
                context: context,
                title: '号码',
                textController: _phoneController),
            const Divider(),
            listGroup1(
                context: context,
                title: '微信号',
                textController: _wechatnameController),
            const Divider(),
            listGroup2(
              context: context,
              title: '性别',
              child: Text(_sexValue),
              icon: const Icon(MyIcon.user_right),
              onTap: () async {
                //触摸失去焦点
                FocusScope.of(context).requestFocus(FocusNode());
                await showModalBottomSheet(
                    backgroundColor: const Color.fromRGBO(1, 1, 1, 0),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            color: Color(0xfff1f1f1)),
                        height: 200.0,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextButton(
                                  child: const Text('男'),
                                  onPressed: () {
                                    setState(() {
                                      _sexValue = "男";
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextButton(
                                  child: const Text('女'),
                                  onPressed: () {
                                    setState(() {
                                      _sexValue = "女";
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextButton(
                                  child: const Text('保密'),
                                  onPressed: () {
                                    setState(() {
                                      _sexValue = "保密";
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
            const Divider(),
            //按钮选择性别
            // Row(
            //   children: <Widget>[
            //     Text(
            //       '性别',
            //     ),
            //     Radio(
            //       value: '男',
            //       groupValue: _radioValue,
            //       activeColor: Theme.of(context).primaryColor,
            //       onChanged: (data) {
            //         setState(() {
            //           _radioValue = data as String?;
            //         });
            //       },
            //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //     ),
            //     Text(
            //       '男',
            //     ),
            //     Radio(
            //       value: '女',
            //       groupValue: _radioValue,
            //       onChanged: (data) {
            //         setState(() {
            //           _radioValue = data as String?;
            //         });
            //       },
            //     ),
            //     Text(
            //       '女',
            //     ),
            //     Radio(
            //       value: '保密',
            //       groupValue: _radioValue,
            //       onChanged: (data) {
            //         setState(() {
            //           _radioValue = data as String?;
            //         });
            //       },
            //     ),
            //     Text(
            //       '保密',
            //     ),
            //   ],
            // ),
          ],
        ));
  }
}
