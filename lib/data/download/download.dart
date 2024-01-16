import 'dart:convert';

import 'package:es_compression/brotli.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class DownloadData extends StatefulWidget {
  const DownloadData({super.key});

  @override
  State<DownloadData> createState() => _DownloadDataState();
}

class _DownloadDataState extends State<DownloadData> {
  String textOfStatus = "";
  double progressValue = 0.0;

  void getData() async {
    setState(() {
      textOfStatus = "Checking Data...";
    });
    final connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      textOfStatus = "Chacking Internet Connectivity...";
      progressValue = 0.03;
    });
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        textOfStatus = "No Internet Connectivity.\nCheck Internet Connection";
        progressValue = 0.00;
      });
    } else {
      final box = Hive.box("info");
      final info = box.get("info", defaultValue: false);
      if (info != false) {
        Map<String, String> preferance = {
          "translation_language": info['translation_language'],
          "translation_book_ID": info["translation_book_ID"],
          "tafseer_language": info['tafseer_language'],
          "tafseer_book_ID": info["tafseer_book_ID"],
          "recitation_ID": info['recitation_ID']
        };
        var url = Uri.parse(
            "https://api.quran.com/api/v4/quran/translations/${preferance['translation_book_ID']}");
        var headers = {"Accept": "application/json"};

        var response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          setState(() {
            textOfStatus = "Translation Downloaded.";
            progressValue = 0.15;
          });
          Map<String, dynamic> mapResponse =
              Map<String, dynamic>.from(json.decode(response.body));
          List<Map<String, dynamic>> translation =
              List<Map<String, dynamic>>.from(mapResponse['translations']);
          Map<String, String> allAyah = {};
          for (int i = 0; i < translation.length; i++) {
            allAyah.addAll({
              "$i": translation[i]['text'].toString(),
            });
          }
          setState(() {
            textOfStatus = "Entering translation data to local database";
            progressValue = 0.20;
          });
          final box = Hive.box("data");
          allAyah.forEach((key, value) {
            box.put("trans${preferance['translation_book_ID']}/$key", value);
          });
        } else {
          setState(() {
            textOfStatus = "Failed while translation is downloading";
          });
        }
        setState(() {
          textOfStatus = "Getting Tafseer...";
          progressValue = 0.21;
        });
        url = Uri.parse(
            "https://api.quran.com/api/v4/quran/tafsirs/${preferance['tafseer_book_ID']}");
        headers = {"Accept": "application/json"};

        response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          setState(() {
            textOfStatus = "Entering translation data to local database";
            progressValue = 0.31;
          });
          final tafseerBox = await Hive.openBox("tafseer");
          Map<String, dynamic> mapResponse =
              Map<String, dynamic>.from(json.decode(response.body));
          List<Map<String, dynamic>> tafseer =
              List<Map<String, dynamic>>.from(mapResponse['tafsirs']);
          Map<String, String> tafseerOfAllAyah = {};
          int counterOfAyah = 0;
          setState(() {
            textOfStatus = "Compressing tafseer";
            progressValue = 0.31;
          });
          for (int i = 0; i < tafseer.length; i++) {
            if (tafseer[i]['resource_id'].toString() ==
                preferance['tafseer_book_ID']) {
              tafseerOfAllAyah.addAll({
                "$counterOfAyah": base64Encode(
                    brotli.encode(utf8.encode(tafseer[i]['text'].toString()))),
              });
              counterOfAyah++;
            }
          }
          setState(() {
            textOfStatus = "Entering tafseer data to local database";
            progressValue = 0.31;
          });
          tafseerOfAllAyah.forEach((key, value) {
            tafseerBox.put(
                "tafseer${preferance['tafseer_book_ID']}/$key", value);
          });
        }
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textOfStatus,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey.shade200,
              color: Colors.green,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Progress : ${(progressValue * 100).toInt()}%"),
          ],
        ),
      ),
    );
  }
}
