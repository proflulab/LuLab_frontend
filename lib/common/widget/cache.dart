// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'package:path_provider/path_provider.dart';

// //参考https://blog.csdn.net/qq_38875767/article/details/106137118
// class Cache extends StatefulWidget {
//   const Cache({Key? key}) : super(key: key);

//   @override
//   State<Cache> createState() => _CacheState();
// }

// class _CacheState extends State<Cache> {
//   var _cacheSizeStr;

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   ///加载缓存
//   Future<void> loadCache() async {
//     try {
//       Directory tempDir = await getTemporaryDirectory();
//       double value = await _getTotalSizeOfFilesInDir(tempDir);
//       tempDir.list(followLinks: false, recursive: true).listen((file) {
//         //打印每个缓存文件的路径
//         if (kDebugMode) {
//           print(file.path);
//         }
//       });
//       if (kDebugMode) {
//         print('临时目录大小: ' + value.toString());
//       }
//       setState(() {
//         _cacheSizeStr = _renderSize(value);
//       });
//     } catch (err) {
//       if (kDebugMode) {
//         print(err);
//       }
//     }
//   }

//   /// 递归方式 计算文件的大小
//   Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
//     try {
//       if (file is File) {
//         int length = await file.length();
//         return double.parse(length.toString());
//       }
//       if (file is Directory) {
//         final List<FileSystemEntity> children = file.listSync();
//         double total = 0;
//         for (final FileSystemEntity child in children) {
//           total += await _getTotalSizeOfFilesInDir(child);
//         }
//         return total;
//       }
//       return 0;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return 0;
//     }
//   }

//   void _clearCache() async {
//     //此处展示加载loading
//     try {
//       Directory tempDir = await getTemporaryDirectory();
//       //删除缓存目录
//       await delDir(tempDir);
//       await loadCache();
//       //ToastUtils.show(msg: '清除缓存成功');
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       //ToastUtils.show(msg: '清除缓存失败');
//     } finally {
//       //此处隐藏加载loading
//     }
//   }

//   ///递归方式删除目录
//   Future<void> delDir(FileSystemEntity file) async {
//     try {
//       if (file is Directory) {
//         final List<FileSystemEntity> children = file.listSync();
//         for (final FileSystemEntity child in children) {
//           await delDir(child);
//         }
//       }
//       await file.delete();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   ///格式化文件大小
//   _renderSize(double value) {
//     // if (null == value) {
//     //   return 0;
//     // }
//     List<String> unitArr = [];
//     // ..add('B')
//     // ..add('K')
//     // ..add('M')
//     // ..add('G');
//     int index = 0;
//     while (value > 1024) {
//       index++;
//       value = value / 1024;
//     }
//     String size = value.toStringAsFixed(2);
//     return size + unitArr[index];
//   }
// }

// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// /// 缓存管理类
// /// ./lib/utils/cache_util.dart
// class CacheUtil {
//   /// 获取缓存大小
//   static Future<int> total() async {
//     Directory tempDir = await getTemporaryDirectory();
//     int total = await _reduce(tempDir);
//     return total;
//   }

//   /// 清除缓存
//   static Future<void> clear() async {
//     Directory tempDir = await getTemporaryDirectory();
//     await _delete(tempDir);
//   }

//   /// 递归缓存目录，计算缓存大小
//   static Future<int> _reduce(final FileSystemEntity file) async {
//     /// 如果是一个文件，则直接返回文件大小
//     if (file is File) {
//       int length = await file.length();
//       return length;
//     }

//     /// 如果是目录，则遍历目录并累计大小
//     if (file is Directory) {
//       final List<FileSystemEntity> children = file.listSync();

//       int total = 0;

//       if (children.isNotEmpty)
//         for (final FileSystemEntity child in children)
//           total += await _reduce(child);

//       return total;
//     }

//     return 0;
//   }

//   /// 递归删除缓存目录和文件
//   static Future<void> _delete(FileSystemEntity file) async {
//     if (file is Directory) {
//       final List<FileSystemEntity> children = file.listSync();
//       for (final FileSystemEntity child in children) {
//         await _delete(child);
//       }
//     } else {
//       await file.delete();
//     }
//   }
// }
