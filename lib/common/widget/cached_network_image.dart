import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedImage {
  //使用进度加载指示
  static Widget typeLaod(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          LinearProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => SvgPicture.asset(
        "assets/images/load.svg",
        //color: PFc.themeColor20,
        semanticsLabel: 'A red up arrow',
        //width: 0.3.sw,
        fit: BoxFit.cover,
      ),
      // Image.asset(
      //   'assets/images/a.png',
      //   fit: BoxFit.cover,
      // ),
    );
  }

  //使用占位图
  static Widget typeBitmap(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => SvgPicture.asset(
        "assets/images/load.svg",
        //color: PFc.themeColor20,
        semanticsLabel: 'A red up arrow',
        //width: 0.3.sw,
        fit: BoxFit.cover,
      ),
      //Image.asset('assets/images/a.png', fit: BoxFit.cover),
      errorWidget: (context, url, error) => SvgPicture.asset(
        "assets/images/load.svg",
        //color: PFc.themeColor20,
        semanticsLabel: 'A red up arrow',
        //width: 0.3.sw,
        fit: BoxFit.cover,
      ),
      //Image.asset('assets/images/a.png', fit: BoxFit.cover),
    );
  }
}

/**
 * 从网络获取图片，并保存到缓存
 *  有占位图和加载出错图
 *
 *   CachedNetworkImage({
    Key key,
    @required this.imageUrl,
    this.imageBuilder,
    this.placeholder,//占位图
    this.errorWidget,//加载出错后显示图片
    this.fadeOutDuration: const Duration(milliseconds: 300),//控制placeholder的淡出动画时间
    this.fadeOutCurve: Curves.easeOut,//控制placeholder的淡出动画方式
    this.fadeInDuration: const Duration(milliseconds: 700),//控制目标图像的淡入动画时间
    this.fadeInCurve: Curves.easeIn,//控制目标图像的淡入动画方式
    this.width,
    this.height,
    this.fit,
    this.alignment: Alignment.center,
    this.repeat: ImageRepeat.noRepeat,
    this.matchTextDirection: false,
    this.httpHeaders,
    this.cacheManager,
    this.useOldImageOnUrlChange: false,
    this.color,
    this.colorBlendMode,
    })
 */

