import 'package:flutter/material.dart';
import 'package:proflu/common/entitys/entitys.dart';
import 'package:proflu/common/utils/utils.dart';

import '../../common/values/colors.dart';
import '../../common/widget/cached_network_image.dart';
import '../../common/widget/text_widget.dart';
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
                            fontSize: 30.w),
                        margin: EdgeInsets.only(bottom: 18.w),
                      ),
                      PFtext.text1(
                          text: TimeChange.client(
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
