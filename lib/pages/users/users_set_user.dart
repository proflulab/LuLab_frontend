// import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

class SetUser extends StatefulWidget {
  const SetUser({Key? key}) : super(key: key);
  @override
  _SetUserState createState() => _SetUserState();
}

class _SetUserState extends State<SetUser> {
  String _sexValue = Global.profile.sex ?? "";
  final TextEditingController _nameController =
      TextEditingController(text: Global.profile.name);
  final TextEditingController _introController =
      TextEditingController(text: Global.profile.description);
  final TextEditingController _phoneController =
      TextEditingController(text: Global.profile.phone);
  final TextEditingController _wechatnameController =
      TextEditingController(text: Global.profile.wechat);

  // 执行修改个人信息操作
  _carryUp() async {
    //_getuser();
    UserUpdaterequest variables = UserUpdaterequest(
      id: Global.profile.id ?? "",
      name: _nameController.value.text,
      description: _introController.value.text,
      phone: _phoneController.value.text,
      sex: _sexValue,
      wechat: _wechatnameController.value.text,
    );
    Data profile = Data(
      birth: '',
      description: _introController.value.text,
      email: '',
      profileImgUrl:
          'https://tse1-mm.cn.bing.net/th/id/OIP-C.8jK5VH-CESQrlEz2RawVwAAAAA?w=210&h=210&c=7&r=0&o=5&dpr=2&pid=1.7',
      id: Global.profile.id,
      name: _nameController.value.text,
      phone: _phoneController.value.text,
      sex: _sexValue,
      wechat: _wechatnameController.value.text,
      industry: '',
      password: '',
    );

    try {
      await GqlUserAPI.userup(context: context, variables: variables);
      Global.saveProfile(profile);
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
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '个人信息',
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Center(
            child: InkWell(
              child: const Text(
                "保存",
                style: TextStyle(
                  fontFamily: 'MyFontStyle',
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                _carryUp();
                if (kDebugMode) {
                  print("保存个人信息");
                  print(_nameController.value.text);
                }
              },
            ),
          ),
          SizedBox(width: PFspace.screenMargin)
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(PFspace.screenMargin),
                padding: EdgeInsets.all(PFspace.screenMargin),
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: listGroup2(
                  context: context,
                  title: '头像',
                  child: SizedBox(
                      child: ClipOval(
                          child: CachedImage.typeLaod(Global.profile.imgUrl!))),
                  icon: const Icon(MyIcon.userRight),
                  onTap: () {
                    if (kDebugMode) {
                      print("该功能未开发，当前无法更改");
                    }
                    toastInfo(msg: '功能未开发，当前无法修改');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(PFspace.screenMargin),
                padding: EdgeInsets.all(PFspace.screenMargin),
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Column(
                  children: [
                    listGroup1(
                        context: context,
                        title: '姓名',
                        textController: _nameController),
                    const Divider(),
                    listGroup1(
                        context: context,
                        title: '号码',
                        textController: _phoneController),
                    const Divider(),
                    listGroup1(
                        context: context,
                        title: '微信',
                        textController: _wechatnameController),
                    const Divider(),
                    listGroup2(
                      context: context,
                      title: '性别',
                      child: Text(_sexValue),
                      icon: const Icon(MyIcon.userRight),
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
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: Color(0xfff1f1f1)),
                              height: 200.0.h,
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60.h,
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
                                      height: 60.h,
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
                                      height: 60.h,
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
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(PFspace.screenMargin),
                padding: EdgeInsets.all(PFspace.screenMargin),
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: listGroup1(
                  context: context,
                  title: '简介',
                  textController: _introController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
