import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

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
  int _sexValue = Global.profile.sex ?? 0;
  final TextEditingController _nameController =
      TextEditingController(text: Global.profile.name);
  final TextEditingController _introController =
      TextEditingController(text: Global.profile.description);
  // final TextEditingController _phoneController =
  //     TextEditingController(text: Global.profile.mobile);
  final TextEditingController _emailnameController =
      TextEditingController(text: Global.profile.email);
  final TextEditingController _mobilenameController =
      TextEditingController(text: Global.profile.mobile);

  // 执行修改个人信息操作
  _carryUp() async {
    //_getuser();
    ChangeUserInfoRequest variables = ChangeUserInfoRequest(
      name: _nameController.value.text,
      dsc: _introController.value.text,
      sex: _sexValue,
      email: _emailnameController.value.text,
    );
    Data profile = Data(
      name: _nameController.value.text,
      description: _introController.value.text,
      sex: _sexValue,
      email: _emailnameController.value.text,
    );

    try {
      await GqlUserAPI.changeUserInfo(context: context, variables: variables);
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
        elevation: 0,
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
              Stack(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: 1000,
                    height: 55,
                    child: Text(
                      '头像',
                      style: TextStyle(fontFamily: 'MyFontStyle'),
                    ),
                    padding: EdgeInsets.all(PFspace.screenMargin),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(350, 0, 0, 6),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/user.png'),
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(PFspace.screenMargin),
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.white),
                child: Column(
                  children: [
                    listGroup1(
                        context: context,
                        title: '姓名',
                        textController: _nameController),
                    const Divider(),
                    listGroup1(
                        context: context,
                        title: '微信',
                        textController: _emailnameController),
                    const Divider(),
                    listGroup1(
                        context: context,
                        title: '电话',
                        textController: _mobilenameController),
                    const Divider(),
                    listGroup2(
                      context: context,
                      title: '性别',
                      child: Text("$_sexValue"),
                      icon: const Icon(PFIcon.userRight),
                      onTap: () async {
                        //触摸失去焦点
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
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
                              height: 0.21.sh,
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 0.07.sh,
                                      width: double.infinity,
                                      child: TextButton(
                                        child: const Text('男'),
                                        onPressed: () {
                                          setState(() {
                                            _sexValue = 1;
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.07.sh,
                                      width: double.infinity,
                                      child: TextButton(
                                        child: const Text('女'),
                                        onPressed: () {
                                          setState(
                                            () {
                                              _sexValue = 2;
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.07.sh,
                                      width: double.infinity,
                                      child: TextButton(
                                        child: const Text('保密'),
                                        onPressed: () {
                                          setState(
                                            () {
                                              _sexValue = 0;
                                              Navigator.pop(context);
                                            },
                                          );
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
                    const Divider(),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.all(PFspace.screenMargin),
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
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

  //弹出底部菜单
  void _showBottomMenu(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(1, 1, 1, 0),
      context: context,
      //isScrollControlled: true,//设为true，此时为全屏展示
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Color(0xfff1f1f1),
          ),
          height: 438.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: const Text(
                  '拍照',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  _takePhoto();
                  Navigator.pop(context);
                },
              ),
              const Divider(
                height: 1,
              ),
              ListTile(
                title: const Text(
                  '相册',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  PFImageCropper.cropImage(
                    PFImagePicker.openPhotoAlbum(),
                  );
                  //_openPhotoAlbum();
                  Navigator.pop(context);
                },
              ),
              Container(
                color: const Color.fromARGB(255, 212, 212, 212),
                height: 15,
              ),
              ListTile(
                title: const Text(
                  '取消',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  late CroppedFile _image;

  ///拍照
  Future _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _cropImage(image!);
    });
  }

  ///打开相册
  Future _openPhotoAlbum() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        _cropImage(image!);
      },
    );
  }

  //剪裁
  _cropImage(XFile imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '裁剪',
          toolbarColor: Colors.black87,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          //lockAspectRatio: false,
          cropFrameStrokeWidth: 10,
          cropFrameColor: PFc.themeColor,
          cropGridColor: PFc.themeColor,
          statusBarColor: PFc.themeColor,
          activeControlsWidgetColor: PFc.themeColor,
          //backgroundColor: PFc.themeColor,
          //dimmedLayerColor: PFc.themeColor,
        ),
        IOSUiSettings(
          title: '裁剪',
        ),
      ],
    );

    if (croppedFile != null) {
      setState(() {
        _image = croppedFile;
      });
    }
  }
}
