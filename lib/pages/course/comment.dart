import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Comment(),
    );
  }
}

class Comment extends StatefulWidget {
  Comment({Key? key}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //  评价顶部
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('综合评分：'),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 25,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 25,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 25,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
                Text(
                  "4.0分",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          // 评论列表
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '全部评价(30)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                height: 500,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    buildEachComment(),
                    buildEachComment(),
                    buildEachComment(),
                    buildEachComment(),
                    buildEachComment(),
                    buildEachComment(),
                    buildEachComment(),
                    buildEachComment(),
                    buildEachComment(),
                    buildEachComment(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildEachComment() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/a.png'),
        ),
        title: Column(
          children: [
            // 头衔
            buildName(),
            // 评分
            buildScore(),
            // 评论
            buildComment(),
            // 时间
            buildData()
          ],
        ),
      ),
    );
  }

  Row buildName() {
    return Row(
      children: [
        Text(
          '有志青年',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '骨干学员',
          style: TextStyle(color: Color(0xffcccccc), fontSize: 15),
        )
      ],
    );
  }

  Row buildScore() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.grey,
        ),
        Text("4.0"),
      ],
    );
  }

  Row buildData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            '2021-09-08 10:56',
            style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.mode_comment,
                color: Color(0xffaaaaaa),
                size: 16,
              ),
              Text(
                '1',
                style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
              ),
              Icon(
                Icons.thumb_up,
                color: Color(0xffaaaaaa),
                size: 16,
              ),
              Text(
                '1',
                style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildComment() {
    return Row(
      children: [
        Expanded(
          child: Text(
            '多行评价文本，此处省略一万字多行评价文本，此处省略一万字多行评价文本，此处省略一万字多行评价文本，此处省略一万字多行评价文本，此处省略一万字',
            style: TextStyle(fontSize: 13),
            textAlign: TextAlign.start,
            // overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
