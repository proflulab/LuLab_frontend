import 'package:flutter/material.dart';

import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';

import 'infor_details.dart';

class InfoItemWidget extends StatelessWidget {
  final LatestInformation information;
  final bool margin;

  const InfoItemWidget(
      {Key? key, required this.information, this.margin = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 690.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin:
          margin ? const EdgeInsets.fromLTRB(15, 15, 15, 0) : EdgeInsets.zero,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InforDetails(
                product: information,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              SizedBox(
                width: 250.w,
                height: 166.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedImage.typeLaod(information.img),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: SizedBox(
                  height: 166.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // height: 68.w,
                        child: PFtext.text1(
                          text: information.title,
                          maxLines: 2,
                          fontSize: PFfont.s32,
                        ),
                        margin: EdgeInsets.only(bottom: 18.w),
                      ),
                      const Flexible(fit: FlexFit.tight, child: SizedBox()),
                      PFtext.text1(
                          text: PFTime.client(
                              int.parse(information.releaseDate),
                              "ymd"), //information.introduction,
                          maxLines: 2,
                          fontSize: 24.w,
                          fontWeight: FontWeight.normal,
                          color: PFc.textSecondary)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
