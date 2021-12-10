import 'package:flutter/material.dart';
import '../../widget/widgets.dart';
import '../../utils/utils.dart';
import '../../values/values.dart';
import '../../api/apis.dart';
import '../../utils/screen.dart';
import '../../entitys/entitys.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // fullName email password 的控制器
  final TextEditingController _fullnameController =
      TextEditingController(text: "news");
  final TextEditingController _passController1 =
      TextEditingController(text: "12345678");
  final TextEditingController _passController =
      TextEditingController(text: "12345678");

  // 返回上一页
  _handleNavPop() {
    Navigator.pop(context);
  }

  // 执行注册操作
  _handleSignUp() async {
    if (!duCheckStringLength(_fullnameController.value.text, 3)) {
      toastInfo(msg: '用户名不能小于3位');
      return;
    }
    if (!duCheckStringLength(_passController1.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    if ('${_passController1.value.text}' != '${_passController.value.text}') {
      toastInfo(msg: '两次密码不一样');
      return;
    }
    Registeredrequest variables = Registeredrequest(
      name: _fullnameController.value.text,
      password: _passController1.value.text,
      ensurePassword: _passController.value.text,
      // password: duSHA256(_passController.value.text),
    );

    //print(variables.name);
    try {
      //GqlUserRegisterResponseEntity userProfile =
      await GqlUserAPI.register(
        context: context,
        variables: variables,
      );

      toastInfo(msg: '注册成功，返回登录页!');
    } catch (e) {
      print("打印错误信息");
      print(e);
      return toastInfo(msg: '注册失败，请正确输入账号、密码!');
    }

    Navigator.pop(context);
  }

  // logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Text(
        "注册",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          //fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(400),
      // height: 204,
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // fullName input
          inputTextEdit(
            controller: _fullnameController,
            keyboardType: TextInputType.text,
            hintText: "账号",
            marginTop: 0,
          ),
          // password input
          inputTextEdit(
            controller: _passController1,
            keyboardType: TextInputType.visiblePassword,
            hintText: "输入密码",
            isPassword: true,
          ),
          // password input
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "确认密码",
            isPassword: true,
          ),

          // 创建
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: btnFlatButtonWidget(
              onPressed: _handleSignUp,
              width: 295,
              fontWeight: FontWeight.w600,
              title: "创建新账户",
            ),
          ),
          // Spacer(),

          // 忘记密码
          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: TextButton(
              onPressed: _handleSignUp,
              child: Text(
                "忘记密码?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 第三方
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "a",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "a",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "a",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavPop,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "我已经有账号",
        fontWeight: FontWeight.w500,
        fontSize: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
