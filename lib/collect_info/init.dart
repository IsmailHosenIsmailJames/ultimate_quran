import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ultimate_quran/collect_info/collect_info.dart';
import 'package:ultimate_quran/screens/home.dart';

class InIt extends StatelessWidget {
  const InIt({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box("info");
    final info = box.get("info", defaultValue: false);
    if (info != false) {
      if (info['transLan'] != "null" &&
          info['tafseerLan'] != "null" &&
          info['recitations'] != "null") {
        Get.offAll(() => const Home());
      } else {
        if (info['transLan'] != "null") {
          Get.offAll(() => const CollectInfo(pageNumber: 0));
        }
        if (info['tafseerLan'] != "null") {
          Get.offAll(() => const CollectInfo(pageNumber: 2));
        }
        if (info['recitations'] != "null") {
          Get.offAll(() => const CollectInfo(pageNumber: 1));
        }
      }
    }
    return const CollectInfo(pageNumber: 0);
  }
}
