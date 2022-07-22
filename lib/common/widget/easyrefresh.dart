import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

class EasyrefreshWidget {
  static Header? getHeader() {
    return ClassicalHeader(
      //key: _headerKey,
      refreshText: '下拉刷新',
      refreshReadyText: '准备刷新',
      refreshingText: '刷新中...',
      refreshedText: '刷新完成',
      infoText: '更新于 %T',
      bgColor: Colors.transparent,
      textColor: Colors.black87,
    );
  }

  static Footer? getFooter() {
    return ClassicalFooter(
      // key: _footerKey,
      loadText: '上拉加载',
      loadReadyText: '准备加载',
      loadingText: '加载中...',
      loadedText: '加载完成',
      noMoreText: '划到底了',
      infoText: '更新于 %T',
      bgColor: Colors.transparent,
      textColor: Colors.black87,
    );
  }
}
