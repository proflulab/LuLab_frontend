import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/entitys/entitys.dart';

//选择城市地区联动索引页
//https://raw.githubusercontent.com/xiedong11/flutter_app/master/static/phoneCode.json

class PhoneCountryCodePage extends StatefulWidget {
  const PhoneCountryCodePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<PhoneCountryCodePage> {
  List<String> letters = [];
  late Phoneresponse fdata;
  late List<Datum> data = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getPhoneCodeDataList();
  }

  getPhoneCodeDataList() async {
    String jsonString =
        await rootBundle.loadString("assets/static/phoneCode.json");
    //print(json.decode(jsonString));
    fdata = Phoneresponse.fromJson(json.decode(jsonString));
    data = fdata.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("城市地区选择"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
                controller: _scrollController,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PhoneCodeIndexName(data[index].name.toUpperCase()),
                      ListView.builder(
                        itemCount: data[index].listData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index2) {
                          return SizedBox(
                            height: 46,
                            child: GestureDetector(
                              //behavior: HitTestBehavior.translucent,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(data[index].listData[index2].name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff434343))),
                                    //Margin(width: 10),
                                    Text(
                                      "+${data[index].listData[index2].code}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffD6D6D6)),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .pop(data[index].listData[index2].code);
                              },
                            ),
                          );
                        },
                      ) //禁用滑动事件),
                    ],
                  );
                }),
          ),
          Align(
            alignment: const FractionalOffset(1.0, 0.5),
            child: SizedBox(
              width: 25,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: letters.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Text(
                        letters[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        setState(() {});
                        var height = index * 45.0;
                        for (int i = 0; i < index; i++) {
                          height += data[i].listData.length * 46.0;
                        }
                        _scrollController.jumpTo(height);
                      },
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PhoneCodeIndexName extends StatelessWidget {
  final String indexName;
  const PhoneCodeIndexName(this.indexName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Padding(
        child: Text(indexName,
            style: const TextStyle(fontSize: 20, color: Color(0xff434343))),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
