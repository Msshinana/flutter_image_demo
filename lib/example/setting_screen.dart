import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_demo/example/common/app_bar.dart';
import 'package:flutter_image_demo/example/common/ex_button.dart';
import 'package:path_provider/path_provider.dart';

class ExampleSettingCache extends StatefulWidget {
  const ExampleSettingCache({Key? key}) : super(key: key);

  @override
  _ExampleSettingCacheState createState() {
    return _ExampleSettingCacheState();
  }
}

class _ExampleSettingCacheState extends State<ExampleSettingCache> {
  String dirValue = '';
  var fileList = [];

  @override
  void initState() {
    super.initState();
    loadCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: 'Cache',
            showGoBack: true,
          ),
          ButtonItemNode(
            text: '清除缓存',
            onPressed: _clearDiskCache,
          ),
          ButtonItemNode(
            text: '清除内存',
            onPressed: _clearMemoryCache,
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemBuilder: (BuildContext ctx, int i) {
          //       String fitem = fileList[i];
          //       return Row(
          //         children: <Widget>[
          //           Text(
          //             fitem,
          //             maxLines: 3,
          //             overflow: TextOverflow.ellipsis,
          //           ),
          //         ],
          //       );
          //     },
          //     itemCount: fileList.length,
          //   ),
          // )
        ],
      ),
    );
  }

  Future<Null> loadCache() async {
    var list = [];
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    tempDir.list(followLinks: false, recursive: true).listen((file) {
      list.add(file.path);
    });
    setState(() {
      dirValue = value.toString();
      fileList = list;
    });
  }

  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) {
        total += await _getTotalSizeOfFilesInDir(child);
      }
      return total;
    }
    return 0;
  }

  void _clearDiskCache() async {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await delDir(tempDir);
    await loadCache();
  }

  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }

  void _clearMemoryCache() {
    PaintingBinding.instance!.imageCache!.clear();
  }
}
