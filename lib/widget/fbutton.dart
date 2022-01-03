import 'package:flutter/material.dart';
import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';

//https://github.com/Fliggy-Mobile/fbutton/blob/master/README_CN.md
//说明文档

///按钮
Widget fButton({
  required String hintText,
}) {
  return FButton(
    text: hintText,
    style: const TextStyle(color: Colors.amber),
    color: const Color(0xffffc900),

    /// 配置 loading 大小
    ///
    /// set loading size
    loadingSize: 15,

    /// 配置 loading 与文本的间距
    ///
    // Configure the spacing between loading and text
    imageMargin: 6,

    /// 配置 loading 的宽
    ///
    /// set loading width
    loadingStrokeWidth: 2,

    /// 是否支持点击自动开始 loading
    ///
    /// Whether to support automatic loading by clicking
    clickLoading: true,

    /// 配置 loading 的颜色
    ///
    /// set loading color
    loadingColor: Colors.white,

    /// 配置 loading 状态时的文本
    ///
    /// set loading text
    loadingText: "Loading...",

    /// 配置 loading 与文本的相对位置
    ///
    /// Configure the relative position of loading and text
    imageAlignment: ImageAlignment.top,
  );
}
