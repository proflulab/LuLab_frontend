import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proflu/common/widget/text_widget.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool backButton;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final double elevation;
  final Color titleColor;
  final Color backgroundColor;
  final Brightness brightness;

  const MyAppBar(
      {Key? key,
      this.title = '',
      this.leading,
      this.actions = const [],
      this.backButton = true,
      this.bottom,
      this.elevation = 0,
      this.backgroundColor = Colors.white,
      this.brightness = Brightness.light,
      this.titleColor = Colors.black})
      : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 44 : 88);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      leading: widget.backButton
          ? (widget.leading ??
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  )))
          : Container(),
      title: PFtext.text1(
        text: widget.title,
        fontSize: 18,
        color: widget.titleColor,
        fontWeight: FontWeight.w400,
      ),
      centerTitle: true,
      elevation: widget.elevation,
      actions: widget.actions,
      bottom: widget.bottom,
      brightness: widget.brightness,
    );
  }
}


