import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ultimate_quran/collect_info/collect_info.dart';
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
    if (info != false) {
      if (info['transLan'] != "null" &&
          info['tafseerLan'] != "null" &&
          info['recitations'] != "null") {
        return const Home();
      } else {
        if (info['transLan'] != "null") {
          return const CollectInfo(pageNumber: 0);
        }
        if (info['tafseerLan'] != "null") {
          return const CollectInfo(pageNumber: 2);
        }
        if (info['recitations'] != "null") {
          return const CollectInfo(pageNumber: 1);
        }
      }
    }
    return const CollectInfo(pageNumber: 0);
  }
}
