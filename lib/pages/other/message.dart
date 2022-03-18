import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我是信息通知区"),
      ),
      body: const Text("我是信息通知区"),
    );
  }
}


// import 'package:flutter/material.dart';

// class Message extends StatefulWidget {
//   const Message({Key? key}) : super(key: key);

//   @override
//   _MessageState createState() => _MessageState();
// }

// class _MessageState extends State<Message> {
//   List<Message> modules = [];

//   @override
//   void initState() {
//     //fetchData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("消息"),
//         elevation: 0,
//         actions: const <Widget>[
//           FlatButton(
//             onPressed: null,
//             child: Icon(
//               Icons.add_alert,
//               color: Colors.blue,
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: RefreshIndicator(
//           child: ListView(
//             children: <Widget>[
//               MessageList(
//                 messages: modules,
//               )
//             ],
//           ),
//           onRefresh: fetchData,
//         ),
//       ),
//     );
//   }
// }
