import 'dart:convert';

List<Ekipman> ekipmanFromMap(String str) =>
    List<Ekipman>.from(json.decode(str).map((x) => Ekipman.fromMap(x)));

String ekipmanToMap(List<Ekipman> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Ekipman {
  String? aciklama;
  String? kontrolsekliadi;
  String? makineadi;
  String? makinekodu;
  String? makinemarkaadi;
  String? makinemodeladi;
  String? makinetipadi;

  Ekipman(
      {this.aciklama,
      this.kontrolsekliadi,
      this.makineadi,
      this.makinekodu,
      this.makinemarkaadi,
      this.makinemodeladi,
      this.makinetipadi});

  factory Ekipman.fromMap(Map<String, dynamic> json) => Ekipman(
        aciklama: json["ACIKLAMA"] == null ? null : json["ACIKLAMA"],
        kontrolsekliadi:
            json["KONTROLSEKLIADI"] == null ? null : json["KONTROLSEKLIADI"],
        makineadi: json["MAKINEADI"] == null ? null : json["MAKINEADI"],
        makinekodu: json["MAKINEKODU"] == null ? null : json["MAKINEKODU"],
        makinemarkaadi:
            json["MAKINEMARKAADI"] == null ? null : json["MAKINEMARKAADI"],
        makinemodeladi:
            json["MAKINEMODELADI"] == null ? null : json["MAKINEMODELADI"],
        makinetipadi:
            json["MAKINETIPADI"] == null ? null : json["MAKINETIPADI"],
      );

  Map<String, dynamic> toMap() => {
        "ACIKLAMA": aciklama == null ? null : aciklama,
        "KONTROLSEKLIADI": kontrolsekliadi == null ? null : kontrolsekliadi,
        "MAKINEADI": makineadi == null ? null : makineadi,
        "MAKINEKODU": makinekodu == null ? null : makinekodu,
        "MAKINEMARKAADI": makinemarkaadi == null ? null : makinemarkaadi,
        "MAKINEMODELADI": makinemodeladi == null ? null : makinemodeladi,
        "MAKINETIPADI": makinetipadi == null ? null : makinetipadi,
      };
}
