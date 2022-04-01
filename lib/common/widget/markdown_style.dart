// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart' as md;
// import 'package:any_syntax_highlighter/any_syntax_highlighter.dart';
// import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme_collection.dart';

// class HighLight extends md.SyntaxHighlighter {
//   @override
//   TextSpan format(String source) {
//     final AnySyntaxHighlighter style = AnySyntaxHighlighter(
//       '#your code goes here',
//       fontSize: 16,
//       lineNumbers: false, // by default false
//       theme: AnySyntaxHighlighterThemeCollection
//           .githubWebTheme(), // you can create and pass custom theme using AnySyntaxHighlighterTheme class
//       isSelectableText:
//           true, // this creates a SelectableText.rich() widget, makes text selectable (by default false)
//       useGoogleFont: 'Lato',
//       copyIcon: const Icon(Icons.copy_rounded,
//           color: Colors.black), // default is white colored icon
//       hasCopyButton: true, // by default false
//       /* other options are:- 
//           padding,
//           margin,
//           textAlign,
//           this.textDirection,
//           softWrap,
//           overflow,
//           textScaleFactor,
//           maxLines,
//           locale,
//           strutStyle,
//           textWidthBasis,
//           textHeightBehavior,
//           overrideDecoration
//           */
//     );
//     return TextSpan(
//         style: const TextStyle(
//           fontSize: 12.0,
//           fontFamily: 'monospace',
//         ),
//         children: [DartSyntaxHighlighter(style).format(source)]);
//   }
// }
