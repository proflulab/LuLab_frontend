import 'package:flutter/material.dart';
import 'package:proflu/common/utils/screen.dart';
import 'package:proflu/common/values/values.dart';
import 'package:readmore/readmore.dart';

// import '../../common/values/values.dart';
// import '../../common/api/apis.dart';
// import '../../common/entitys/entitys.dart';
// import '../../common/utils/utils.dart';
// import '../../common/values/values.dart';
import '../../common/entitys/data_home_feat.dart';
import '../../common/widget/widgets.dart';

class FeatsVideo extends StatefulWidget {
  const FeatsVideo({
    Key? key,
    required this.classificationUser,
  }) : super(key: key);
  final LatestClassificationUser classificationUser;

  @override
  State<FeatsVideo> createState() => _FeatsVideoState();
}

class _FeatsVideoState extends State<FeatsVideo> {
  LatestClassificationUser get classificationUser => widget.classificationUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PFtext.text1(text: "功勋学员", fontSize: 18),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: PFc.backgroundBlack,
              child: Center(
                  child: VideoScreen(
                cover: 'https://images.leotian.cn/blog/2019-04-29-102020.jpg',
                url: classificationUser.videoUrl!,
              )
                  // VideoView(
                  //   widget.product,
                  //   //cover: 'https://images.leotian.cn/blog/2019-04-29-102020.jpg',
                  // ),
                  ),
            ),
          ),
          _buildBottomWidget(),
          Positioned(
            child: ReadMoreText(
              classificationUser.detailMsg!,
              trimLines: 1,
              trimMode: TrimMode.Line,
              trimCollapsedText: "详情",
              trimExpandedText: "",
              colorClickableText: PFc.thirdElementText,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            top: 24.w,
            left: 24.w,
            right: 24.w,
          )
        ],
      ),
    );
  }

  Positioned _buildBottomWidget() {
    return Positioned(
      child: Container(
        height: 128.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            SizedBox(
                width: 72.w,
                height: 72.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36.w),
                  child:
                      CachedImage.typeLaod(classificationUser.profileImgUrl!),
                )),
            SizedBox(width: 10.w),
            SizedBox(
              height: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PFtext.text1(text: classificationUser.name!, fontSize: 16),
                  PFtext.text1(
                    text: classificationUser.description!,
                    fontSize: 13,
                    color: PFc.thirdElementText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      left: 30.w,
      right: 30.w,
      bottom: 20.w,
    );
  }
}
