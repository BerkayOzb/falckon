import 'dart:convert';

List<BakimDetaylariList> bakimDetaylariListFromMap(String str) =>
    List<BakimDetaylariList>.from(
        json.decode(str).map((x) => BakimDetaylariList.fromMap(x)));

String bakimDetaylariListToMap(List<BakimDetaylariList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

//BakimDetaylariList bakimDetaylariListFromMap(String str) =>
// BakimDetaylariList.fromMap(json.decode(str));

//String bakimDetaylariListToMap(BakimDetaylariList data) =>
//json.encode(data.toMap());

class BakimDetaylariList {
  BakimDetaylariList({
    this.aciklama,
    this.guid,
    required this.sonuc,
  });

  final String? aciklama;
  final String? guid;
  final bool sonuc;

  factory BakimDetaylariList.fromMap(Map<String, dynamic> json) =>
      BakimDetaylariList(
        aciklama: json["ACIKLAMA"] == null ? null : json["ACIKLAMA"],
        guid: json["GUID"] == null ? null : json["GUID"],
        sonuc: json["SONUC"] == null ? null : json["SONUC"],
      );

  Map<String, dynamic> toMap() => {
        "ACIKLAMA": aciklama == null ? null : aciklama,
        "GUID": guid == null ? null : guid,
        "SONUC": sonuc ? 1 : 0,
      };
}
