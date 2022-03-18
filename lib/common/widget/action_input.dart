// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// // import '../../common/widget/toast.dart';
// // import '../../common/global/global.dart';
// // import '../../common/api/apis.dart';
// // import '../../common/entitys/entitys.dart';
// // import '../../common/utils/utils.dart';
// import '../../common/values/values.dart';

// typedef ActionInputSelect = void Function(String text);

// //评论底部弹窗
// class TKActionComment {
//   static void showActionSheet(
//     BuildContext context, {
//     required FocusNode focusNode,
//     required TextEditingController textController,
//     String placehold = '',
//     required ActionInputSelect submitAction,
//   }) {
//     showModalBottomSheet(
//         context: context,
//         backgroundColor: Colors.transparent,
//         builder: (ctx) {
//           return TKActionInputDialog(
//             placehold: placehold,
//             focusNode: focusNode,
//             textController: textController,
//             submitAction: submitAction,
//             key: null,
//           );
//         });
//   }
// }

// class TKActionInputDialog extends StatefulWidget {
//   final String placehold;
//   final FocusNode focusNode;
//   final TextEditingController textController;
//   final ActionInputSelect submitAction;

//   const TKActionInputDialog({
//     required Key? key,
//     required this.placehold,
//     required this.focusNode,
//     required this.textController,
//     required this.submitAction,
//   }) : super(key: key);

//   @override
//   _TKActionInputDialogState createState() => _TKActionInputDialogState();
// }

// class _TKActionInputDialogState extends State<TKActionInputDialog>
//     with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance?.addObserver(this);
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     WidgetsBinding.instance?.removeObserver(this);
//   }

//   @override
//   void didChangeMetrics() {
//     super.didChangeMetrics();

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaQueryData = MediaQueryData.fromWindow(ui.window);
//     return AnimatedContainer(
//       color: Colors.transparent,
//       duration: const Duration(milliseconds: 200),
//       alignment: Alignment.bottomCenter,
//       padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
//       child: Material(
//         child: Container(
//           height: 50,
//           color: Colors.white,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Row(
//             children: <Widget>[renderTextInput(), renderSenderButton()],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget renderTextInput() {
//     return Expanded(
//       child: TextField(
//         keyboardType: TextInputType.text,
//         focusNode: widget.focusNode,
//         controller: widget.textController,
//         autofocus: true,
//         //maxLines: null,
//         style: const TextStyle(fontSize: 14, color: ProfluC.textPrimary),
//         textInputAction: TextInputAction.send,
//         textAlignVertical: TextAlignVertical.top,
//         textAlign: TextAlign.start,
//         decoration: InputDecoration(
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//           hintText: widget.placehold,
//           hintStyle: const TextStyle(fontSize: 14, color: ProfluC.textPrimary),
//           counterText: '',
//           filled: true,
//           fillColor: ProfluC.themeColor10,
//           enabledBorder: OutlineInputBorder(
//               borderSide:
//                   const BorderSide(style: BorderStyle.none, color: Colors.lime),
//               borderRadius: BorderRadius.circular(30)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                   style: BorderStyle.none, color: Colors.transparent),
//               borderRadius: BorderRadius.circular(30)),
//         ),
//         onSubmitted: (text) {
//           widget.focusNode.unfocus();
//           if (Navigator.of(context).canPop()) {
//             Navigator.of(context).pop();
//           }
//           widget.submitAction(text);
//         },
//       ),
//     );
//   }

//   Widget renderSenderButton() {
//     return GestureDetector(
//       child: Container(
//         padding: const EdgeInsets.only(left: 16),
//         child: const Center(
//           child: Text('发送',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: ProfluC.textEmphasis,
//               )),
//         ),
//       ),
//       onTap: () {
//         widget.focusNode.unfocus();
//         if (Navigator.of(context).canPop()) {
//           Navigator.of(context).pop();
//         }
//         widget.submitAction(widget.textController.text);
//       },
//     );
//   }
// }
