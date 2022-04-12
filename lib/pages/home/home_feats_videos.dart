import 'package:flutter/material.dart';
import 'package:proflu/common/values/values.dart';

// import '../../common/values/values.dart';
// import '../../common/api/apis.dart';
// import '../../common/entitys/entitys.dart';
// import '../../common/utils/utils.dart';
// import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

class FeatsVideo extends StatefulWidget {
  const FeatsVideo({
    Key? key,
    required this.product,
  }) : super(key: key);
  final String product;

  @override
  State<FeatsVideo> createState() => _FeatsVideoState();
}

class _FeatsVideoState extends State<FeatsVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: PFc.backgroundBlack,
        child: Center(
          child: VideoView(
            widget.product,
            //cover: 'https://images.leotian.cn/blog/2019-04-29-102020.jpg',
          ),
        ),
      ),
    );
  }
}
