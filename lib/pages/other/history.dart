import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我是观看历史区"),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return ListTile(
                trailing: const Icon(Icons.chevron_right),
                title: const Text(
                  '课程名称',
                  style: TextStyle(fontSize: 13),
                ),
                subtitle: const Text("简介简介简介简介简介"),
                leading: Container(
                  width: 50,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  child: Image.network(
                    'https://tse2-mm.cn.bing.net/th/id/OIP-C.tFVNDYNDkIfVoD3631C9TAHaE7?w=301&h=199&c=7&r=0&o=5&dpr=1.25&pid=1.7',
                  ),
                ));
          }),
    );
  }
}
