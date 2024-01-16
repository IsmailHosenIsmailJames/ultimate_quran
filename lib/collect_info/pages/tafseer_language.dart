import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_quran/collect_info/getx/get_controller.dart';

import '../../api/some_api_response.dart';

class TafseerLanguage extends StatefulWidget {
  const TafseerLanguage({super.key});

  @override
  State<TafseerLanguage> createState() => _TafseerLanguageState();
}

class _TafseerLanguageState extends State<TafseerLanguage> {
  late List<String> language;
  void getLanguageList() {
    Set<String> temLangauge = {};
    for (int index = 0; index < allTafseer.length; index++) {
      temLangauge.add(allTafseer[index]["language_name"]);
    }
    List<String> x = temLangauge.toList();
    x.sort();
    language = x;
  }

  @override
  void initState() {
    getLanguageList();
    super.initState();
  }

  final tafseerLanguage = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choice a Tafseer Language")),
      body: ListView.builder(
        padding:
            const EdgeInsets.only(bottom: 100, top: 10, left: 10, right: 10),
        itemCount: language.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(language[index]),
            leading: Obx(
              () => Radio(
                value: index,
                groupValue: tafseerLanguage.tafseerIndex.value,
                onChanged: (value) {
                  tafseerLanguage.tafseerIndex.value = value!;
                  tafseerLanguage.tafseerLanguage.value = language[value];
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
