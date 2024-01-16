import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ultimate_quran/collect_info/collect_info.dart';
import 'package:ultimate_quran/data/download/download.dart';
import 'package:ultimate_quran/screens/home.dart';

class InIt extends StatefulWidget {
  const InIt({super.key});

  @override
  State<InIt> createState() => _InItState();
}

class _InItState extends State<InIt> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box("info");
    final info = box.get("info", defaultValue: false);
    final dataBox = Hive.box("data");
    final data = dataBox.get("status", defaultValue: false);
    if (info == false) {
      return const CollectInfo(pageNumber: 0);
    }

    if (!(data &&
        data['quran'] &&
        data['translation'] &&
        data['tafseer'] &&
        data['recitation'])) {
      return const DownloadData();
    }
    return const Home();
  }
}
