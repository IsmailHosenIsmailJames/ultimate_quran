import 'dart:convert';

class InfoModel {
  String transLan;
  String tafseerLan;
  String recitations;

  InfoModel({
    required this.transLan,
    required this.tafseerLan,
    required this.recitations,
  });

  factory InfoModel.fromJson(String str) => InfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoModel.fromMap(Map<String, dynamic> json) => InfoModel(
        transLan: json["transLan"],
        tafseerLan: json["tafseerLan"],
        recitations: json["recitations"],
      );

  Map<String, dynamic> toMap() => {
        "transLan": transLan,
        "tafseerLan": tafseerLan,
        "recitations": recitations,
      };
}
