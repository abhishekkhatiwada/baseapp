// To parse this JSON data, do
//
//     final fetchedList = fetchedListFromJson(jsonString);

import 'dart:convert';

FetchedList fetchedListFromJson(String str) =>
    FetchedList.fromJson(json.decode(str));

String fetchedListToJson(FetchedList data) => json.encode(data.toJson());

class FetchedList {
  String iconUrl;
  String id;
  String url;
  String value;

  FetchedList({
    required this.iconUrl,
    required this.id,
    required this.url,
    required this.value,
  });

  factory FetchedList.fromJson(Map<String, dynamic> json) => FetchedList(
        iconUrl: json["icon_url"] ?? '',
        id: json["id"] ?? '',
        url: json["url"] ?? '',
        value: json["value"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "id": id,
        "url": url,
        "value": value,
      };
}
