import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:proflu/common/utils/utils.dart';
import 'package:proflu/common/values/values.dart';
import 'package:proflu/common/widget/my_appbar.dart';
import 'package:proflu/common/widget/widgets.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  bool _enable = false;

  @override
  void initState() {
    super.initState();
    _controller1.addListener(_textChangeListener);
    _controller2.addListener(_textChangeListener);
  }

  _textChangeListener() {
    String pwd = _controller1.text;
    String rePwd = _controller2.text;
    if (pwd.length >= 6 && pwd == rePwd) {
      _enable = true;
    } else {
      _enable = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: const MyAppBar(
          title: "密码重置",
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              PFtext.text1(text: "输入新密码", fontSize: 22),
              PFtext.text1(
                  text: "输入6~16位新密码", fontSize: 12, color: PFc.textSecondary),
              const SizedBox(height: 30),
              TextField(
                controller: _controller1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "请输入密码",
                  counterText: "",
                ),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'MyFontStyle',
                ),
                obscureText: true,
                maxLength: 16,
              ),
              const Divider(height: 1),
              const SizedBox(height: 10),
              TextField(
                controller: _controller2,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "请再次输入密码",
                  counterText: "",
                ),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'MyFontStyle',
                ),
                obscureText: true,
                maxLength: 16,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _submit,
            child: Container(
              width: double.infinity,
              height: 96.w,
              decoration: BoxDecoration(
                color: _enable ? PFc.themeColor : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: PFtext.text1(
                  text: "完成",
                  fontSize: 15,
                  color: _enable ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller1.removeListener(_textChangeListener);
    _controller2.removeListener(_textChangeListener);
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  _submit() {
    if (!_enable) return;
    String pwd = _controller1.text;
    String rePwd = _controller2.text;
  }
}
