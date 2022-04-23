import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '/pages/home/home_feats_videos.dart';

import '../../common/api/apis.dart';
import '../../common/values/values.dart';
import '../../common/utils/utils.dart';
//import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/widget/widgets.dart';
//import 'common_richtext.dart';

class FeastPersonal extends StatefulWidget {
  const FeastPersonal({Key? key, required this.product}) : super(key: key);
  final LatestClassificationUser product;

  @override
  _FeastPersonalState createState() => _FeastPersonalState();
}

class _FeastPersonalState extends State<FeastPersonal> {
  bool mIsExpansion = false;

  //最大显示行数（默认 3 行）
  int mMaxLine = 3;

  late FeatsExperienceReponse _postsData;
  List<LatestUserGrowth> _focusData = [];

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  //
  _loadAllData() async {
    _postsData = await GqlHomeAPI.featExperienceInfo(
      context: context,
      variables: FeatsExperienceRequest(
          limit: 0, skip: 0, userId: '624e90a7b2cc58a87ff8432c'),
    );

    if (mounted) {
      setState(() {
        _focusData = _postsData.latestUserGrowth;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: ListView(
        children: <Widget>[
          _img(),
          _profileInfo(),
          SizedBox(height: 15.w),
          _experience(),
        ],
      ),
    );
  }

  _img() {
    return Container(
      height: 140.h + 140.w + 5.h,
      margin: EdgeInsets.only(
        left: PFspace.screenMargin,
        right: PFspace.screenMargin,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: PFc.backgroundSecondary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.w)),
      ),
      child: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: 180.h,
              //width: MediaQuery.of(context).size.width,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.w),
                ),
                child: CachedImage.typeLaod(widget.product.bigCoverUrl),
              ),
            ),
          ),
          Positioned(
            top: 170.h,
            right: 40.w,
            child: RawChip(
              label: const Text('视频介绍'),
              onPressed: () {
                if (kDebugMode) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeatsVideo(
                        classificationUser: widget.product,
                      ),
                    ),
                  );
                }
              },
              onDeleted: () {},
              backgroundColor: PFc.themeColor30,
              deleteIcon: const Icon(Icons.play_circle_filled_rounded),
              deleteIconColor: Colors.red,
              deleteButtonTooltipMessage: '播放',
            ),
          ),
          Positioned(
            width: 140.w,
            height: 140.w,
            top: 140.h,
            left: PFspace.screenMargin - 15.w,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: PFc.backgroundSecondary,
                borderRadius: BorderRadius.all((Radius.circular(70.w))),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(75.w),
                ),
                child: CachedImage.typeLaod(widget.product.imgUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _profileInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      padding: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        color: PFc.backgroundSecondary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.w)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              PFtext.text1(
                text: widget.product.name,
                fontSize: 25,
              ),
              //Text(widget.product.name),
              SizedBox(width: 5.w),
              Icon(
                widget.product.sex == "1"
                    ? Icons.male
                    : widget.product.sex == "2"
                        ? Icons.female
                        : null,
                size: 20,
              ),
            ],
          ),
          SizedBox(height: 15.w),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: PFc.themeColor30,
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                ),
                child: Row(
                  children: [
                    Text(_focusData.isNotEmpty ? _focusData[0].company : ""),
                    //Icon(Icons.star),
                  ],
                ),
              ),
              SizedBox(width: 15.w),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: PFc.themeColor30,
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                ),
                child: Row(
                  children: [
                    Text(_focusData.isNotEmpty ? _focusData[0].position : ""),
                    //Icon(Icons.star),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.w),
          Row(
            children: [
              const Text("所在位置："),
              SizedBox(width: 5.w),
              Text(widget.product.location[0] +
                  "·" +
                  widget.product.location[1]),
            ],
          ),
          SizedBox(height: 15.w),
          Row(
            children: [
              const Text("家　　乡："),
              SizedBox(width: 5.w),
              Text(widget.product.homeTown[0] +
                  "·" +
                  widget.product.homeTown[1]),
            ],
          ),
          const Divider(),
          //CommonRichText(text: widget.product.detailMsg),
          ReadMoreText(
            widget.product.detailMsg,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimExpandedText: "收起",
            trimCollapsedText: "展开",
            colorClickableText: PFc.thirdElementText,
            callback: (v) {},
            style: const TextStyle(
              fontSize: 14,
              //color: PFc.textSecondary,
              //fontFamily: "MyFontStyle",
            ),
          ),
          SizedBox(height: 16.w),
        ],
      ),
    );
  }

  _experience() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      padding: EdgeInsets.all(PFspace.screenMargin),
      decoration: BoxDecoration(
        color: PFc.backgroundSecondary,
        borderRadius: BorderRadius.all(Radius.circular(25.w)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PFtext.text1(text: "个人经历", fontSize: 20),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _focusData.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 100.w,
                    child: CachedImage.typeLaod(_focusData[index].logoUrl),
                  ),
                  SizedBox(width: PFspace.ruleS),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PFtext.text1(
                            text: _focusData[index].position, fontSize: 22),
                        SizedBox(height: 10.w),
                        Text(" " + _focusData[index].company),
                        SizedBox(height: 10.w),
                        Text(
                          " "
                          "${PFTime.client(int.parse(_focusData[index].beginTime), "ym.")}-${PFTime.client(int.parse(_focusData[index].endTime), "ym.")} ${PFTime.diff(_focusData[index].beginTime, _focusData[index].endTime)}",
                        ),
                        SizedBox(height: 10.w),
                        Text(
                          " " + _focusData[index].desc,
                          style: const TextStyle(color: PFc.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
