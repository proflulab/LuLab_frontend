import 'package:flutter/material.dart';

class CommentDetail extends StatefulWidget {
  final product;
  const CommentDetail({Key? key, required this.product}) : super(key: key);

  @override
  _CommentDetailState createState() => _CommentDetailState();
}

class _CommentDetailState extends State<CommentDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.product.authorImg),
        ),
        title: Column(
          children: [
            // 头衔
            Row(
              children: [
                Text(
                  widget.product.authorName,
                  style: const TextStyle(fontSize: 15),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                // Text(
                //   '骨干学员',
                //   style: TextStyle(color: Color(0xffcccccc), fontSize: 15),
                // )
              ],
            ),

            // 评论
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.content,
                    style: const TextStyle(fontSize: 13),
                    textAlign: TextAlign.start,
                    // overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
            // 时间
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    widget.product.addTime,
                    style: const TextStyle(color: const Color(0xffaaaaaa), fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.mode_comment_outlined,
                        color: Color(0xffaaaaaa),
                        size: 16,
                      ),
                      Text(
                        '1',
                        style:
                            TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
                      ),
                      Icon(
                        Icons.thumb_up,
                        color: Color(0xffaaaaaa),
                        size: 16,
                      ),
                      Text(
                        '1',
                        style:
                            TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
