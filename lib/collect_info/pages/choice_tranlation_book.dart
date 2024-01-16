import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_quran/api/some_api_response.dart';
import 'package:ultimate_quran/collect_info/getx/get_controller.dart';

class ChoiceTranslationBook extends StatefulWidget {
  const ChoiceTranslationBook({super.key});

  @override
  State<ChoiceTranslationBook> createState() => _ChoiceTranslationStateBook();
}

class _ChoiceTranslationStateBook extends State<ChoiceTranslationBook> {
  final infoController = Get.put(InfoController());
  List<List<String>> books = [];
  void getBooksAsLanguage() {
    for (int i = 0; i < allTranslationLanguage.length; i++) {
      Map<String, dynamic> book = allTranslationLanguage[i];
      if (book['language_name'] == infoController.translationLanguage.value) {
        String autor = book['author_name'];
        String bookName = book['name'];
        String id = book['id'].toString();
        books.add([autor, bookName, id]);
      }
    }
  }

  @override
  void initState() {
    getBooksAsLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choice a  Translation Book")),
      body: ListView.builder(
        padding:
            const EdgeInsets.only(bottom: 100, top: 10, left: 10, right: 10),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  books[index][1],
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  books[index][0],
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            leading: Obx(
              () => Radio(
                value: index,
                groupValue: infoController.bookNameIndex.value,
                onChanged: (value) {
                  infoController.bookNameIndex.value = value!;
                  infoController.bookIDTranslation.value = books[value][2];
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
