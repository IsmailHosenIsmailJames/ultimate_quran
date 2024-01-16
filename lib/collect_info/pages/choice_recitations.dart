import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_quran/api/some_api_response.dart';
import 'package:ultimate_quran/collect_info/getx/get_controller.dart';

class RecitaionChoice extends StatefulWidget {
  const RecitaionChoice({super.key});

  @override
  State<RecitaionChoice> createState() => _RecitaionChoiceState();
}

class _RecitaionChoiceState extends State<RecitaionChoice> {
  final infoController = Get.put(InfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choice Recitation"),
      ),
      body: ListView.builder(
        padding:
            const EdgeInsets.only(bottom: 100, top: 10, left: 10, right: 10),
        itemCount: allRecitation.length,
        itemBuilder: (context, index) {
          return ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allRecitation[index]["reciter_name"],
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  "Style: ${allRecitation[index]["style"] ?? "Unknown"}",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            leading: Obx(
              () => Radio(
                value: index,
                groupValue: infoController.recitationIndex.value,
                onChanged: (value) {
                  infoController.recitationIndex.value = value!;
                  infoController.recitationID.value =
                      allRecitation[value]["id"].toString();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
