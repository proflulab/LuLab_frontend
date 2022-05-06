import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:proflu/common/utils/utils.dart';
import 'package:proflu/common/values/values.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/entitys/entitys.dart';

import 'contrast.dart';

//选择城市地区联动索引页
//https://raw.githubusercontent.com/xiedong11/flutter_app/master/static/phoneCode.json

class PhoneCountryCodePage extends StatefulWidget {
  const PhoneCountryCodePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<PhoneCountryCodePage> {
  List<String> letters = [];

  List<ListDatum> datums = [];

  List<ListDatum> result = [];

  late Phoneresponse fdata;
  late List<Datum> data = [];

  double _top = 100;

  bool _float = false;

  final ScrollController _scrollController = ScrollController();

  TextEditingController myController = TextEditingController();

  TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPhoneCodeDataList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getPhoneCodeDataList() async {
    String jsonString =
        await rootBundle.loadString("assets/static/phoneCode.json");

    fdata = Phoneresponse.fromJson(json.decode(jsonString));

    if (fdata.code == 200) {
      setState(() {
        data = fdata.data;
        for (int i = 0; i < data.length; i++) {
          letters.add(data[i].name.toUpperCase());
        }

        for (int i = 0; i < data.length; i++) {
          for (int j = 0; j < data[i].listData.length; j++) {
            datums.add(data[i].listData[j]);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          child: Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(230, 230, 230, 1.0),
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              autofocus: false,
              controller: searchcontroller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "搜索",
                contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                border: InputBorder.none,
              ),
              maxLines: 1,
              autocorrect: false,
              onChanged: (value) {
                setState(() {
                  value;
                  result.clear();
                  for (int i = 0; i < datums.length; i++) {
                    if (PFcontrast.client(value, datums[i].name) &&
                        value != "") {
                      result.add(datums[i]);
                    }
                  }
                  if (result.isEmpty) {}
                });
                if (kDebugMode) {
                  print("你输入的内容为$value");
                }
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          result.isEmpty
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        PhoneCodeIndexName(data[index].name.toUpperCase()),
                        ListView.separated(
                          itemCount: data[index].listData.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index2) {
                            return GestureDetector(
                              child: SizedBox(
                                height: 46,
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: PFspace.screenMargin),
                                  child: Row(
                                    children: <Widget>[
                                      Text(data[index].listData[index2].name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff434343))),
                                      Text(
                                        "   +${data[index].listData[index2].code}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff434343)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.back(
                                    result: data[index].listData[index2].code);
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              height: 0,
                              color: Colors.grey,
                              indent: PFspace.screenMargin,
                            );
                          },
                        ),
                      ],
                    );
                  },
                )
              : ListView.separated(
                  itemCount: result.length,
                  //shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index3) {
                    return GestureDetector(
                      child: SizedBox(
                        height: 46,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: PFspace.screenMargin),
                          child: Row(
                            children: <Widget>[
                              Text(result[index3].name,
                                  style: const TextStyle(
                                      fontSize: 16, color: Color(0xff434343))),
                              Text(
                                "   +${result[index3].code}",
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xff434343)),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Get.back(result: result[index3].code);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 0,
                      color: Colors.grey,
                      indent: PFspace.screenMargin,
                    );
                  },
                ),
          Align(
            alignment: const FractionalOffset(1.0, 0.5),
            child: GestureDetector(
              onVerticalDragStart: (details) {
                if (kDebugMode) {
                  print("onVerticalDragStart---${details.localPosition.dy}");
                }
                setState(() {
                  _high(details.localPosition.dy);
                  _float = true;
                });
              },
              onVerticalDragCancel: () {
                if (kDebugMode) {
                  print("onVerticalDragCancel");
                }
              },
              onVerticalDragDown: (details) {
                if (kDebugMode) {
                  print("onVerticalDragDown---${details.localPosition.dy}");
                }
                setState(() {
                  _high(details.localPosition.dy);
                  _float = false;
                });
              },
              onVerticalDragEnd: (details) {
                if (kDebugMode) {
                  print(
                      "onVerticalDragEnd---${details.velocity}---${details.primaryVelocity}");
                }
                setState(() {
                  _float = false;
                });
              },
              onVerticalDragUpdate: (details) {
                if (kDebugMode) {
                  print("onVerticalDragUpdate----${details.localPosition.dy}");
                }
                setState(() {
                  _high(details.localPosition.dy);
                });
              },
              child: SizedBox(
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: letters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            letters[index],
                            style:
                                index == ((_top - 100) ~/ 20) && _float == true
                                    ? const TextStyle(
                                        color: PFc.themeColor, fontSize: 20)
                                    : const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 50,
              top: _top,
              child: _float == true
                  ? Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26.w),
                        color: PFc.themeColor,
                      ),
                      child: Center(
                        child: Text(letters.isEmpty
                            ? ""
                            : letters[((_top - 100) ~/ 20)]),
                      ),
                    )
                  : const Text("")),
        ],
      ),
    );
  }

  _high(e) {
    if (e > 100 && e < 100 + letters.length * 20) {
      _top = e;
      var a = (_top - 100) ~/ 20;
      var height = a * 45.0;
      for (int i = 0; i < a; i++) {
        height += data[i].listData.length * 46.0;
      }
      _scrollController.jumpTo(height);
    }
  }
}

class PhoneCodeIndexName extends StatelessWidget {
  final String indexName;
  const PhoneCodeIndexName(this.indexName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      color: PFc.backgroundBlack10,
      child: Padding(
        child: Text(indexName,
            style: const TextStyle(fontSize: 20, color: Color(0xff434343))),
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: PFspace.screenMargin),
      ),
    );
  }
}
