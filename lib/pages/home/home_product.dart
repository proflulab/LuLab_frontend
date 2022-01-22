import 'package:flutter/material.dart';
import 'package:flutter_echart/flutter_echart.dart';
import 'package:zefyrka/zefyrka.dart';

class Train extends StatefulWidget {
  Train({Key? key}) : super(key: key);

  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  final List<EChartPieBean> _dataList = [
    EChartPieBean(title: "生活费", number: 200, color: Colors.lightBlueAccent),
    EChartPieBean(title: "游玩费", number: 200, color: Colors.deepOrangeAccent),
    EChartPieBean(title: "交通费", number: 400, color: Colors.green),
    EChartPieBean(title: "贷款费", number: 300, color: Colors.amber),
    EChartPieBean(title: "电话费", number: 200, color: Colors.orange),
  ];
  ZefyrController _controller = ZefyrController();
  @override
  Widget build(BuildContext context) {
    // return buildPieChatWidget(_dataList);
    // return const Text('nihapo');
    // return Container(
    //     width: 420.0, //容器的相关参数
    //     height: 245.0,
    //     alignment: Alignment.center, //在容器的位置
    //     child: buildPieChatWidget(_dataList));
    // return ChartTestPage();
    // return SearchBarDemo();
    // return MyHomePage(
    //   title: '',
    // );
    // return FanYe();
    return Column(
      children: [
        ZefyrToolbar.basic(controller: _controller),
        Expanded(
          child: ZefyrEditor(
            controller: _controller,
          ),
        ),
      ],
    );
    // return TanChuang();
  }

  PieChatWidget buildPieChatWidget(_dataList) {
    return PieChatWidget(
      dataList: _dataList,
      //是否输出日志
      isLog: true,
      //是否需要背景
      isBackground: true,
      //是否画直线
      isLineText: true,
      //背景
      bgColor: Colors.white,
      //是否显示最前面的内容
      isFrontgText: true,
      //默认选择放大的块
      initSelect: 1,
      //初次显示以动画方式展开
      openType: OpenType.ANI,
      //旋转类型
      loopType: LoopType.DOWN_LOOP,
      //点击回调
      clickCallBack: (int value) {
        print("当前点击显示 $value");
      },
    );
  }
}
