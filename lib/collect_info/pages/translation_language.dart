import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_quran/api/some_api_response.dart';
import 'package:ultimate_quran/collect_info/getx/get_controller.dart';

class TranslationLanguage extends StatefulWidget {
  const TranslationLanguage({super.key});

  @override
  State<TranslationLanguage> createState() => _TranslationLanguageState();
}

class _TranslationLanguageState extends State<TranslationLanguage> {
  late List<String> language;
  void getLanguageList() {
    Set<String> temLangauge = {};
    for (int index = 0; index < allTranslationLanguage.length; index++) {
      temLangauge.add(allTranslationLanguage[index]["language_name"]);
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

  final translationLanguageController = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choice a Translation Language")),
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
                groupValue: translationLanguageController
                    .selectedOptionTranslation.value,
                onChanged: (value) {
                  translationLanguageController
                      .selectedOptionTranslation.value = value!;
                  translationLanguageController.translationLanguage.value =
                      language[value];
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
