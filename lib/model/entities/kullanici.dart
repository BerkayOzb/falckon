import 'dart:convert';

List<Kullanici> kullaniciFromMap(String str) =>
    List<Kullanici>.from(json.decode(str).map((x) => Kullanici.fromMap(x)));

String adresToMap(List<Kullanici> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Kullanici {
  Kullanici({
    this.idariisleryetkili,
    this.ikyetkili,
    this.kullaniciadisoyadi,
    this.kullaniciid,
    this.loginkodu,
    this.personelid,
    this.yetkiliprojeler,
  });

  final dynamic idariisleryetkili;
  final dynamic ikyetkili;
  final String? kullaniciadisoyadi;
  final int? kullaniciid;
  final String? loginkodu;
  final int? personelid;
  final List<Yetkiliprojeler>? yetkiliprojeler;

  factory Kullanici.fromMap(Map<String, dynamic> json) => Kullanici(
        idariisleryetkili: json["IDARIISLERYETKILI"],
        ikyetkili: json["IKYETKILI"],
        kullaniciadisoyadi: json["KULLANICIADISOYADI"] == null
            ? null
            : json["KULLANICIADISOYADI"],
        kullaniciid: json["KULLANICIID"] == null ? null : json["KULLANICIID"],
        loginkodu: json["LOGINKODU"] == null ? null : json["LOGINKODU"],
        personelid: json["PERSONELID"] == null ? null : json["PERSONELID"],
        yetkiliprojeler: json["YETKILIPROJELER"] == null
            ? null
            : List<Yetkiliprojeler>.from(
                json["YETKILIPROJELER"].map((x) => Yetkiliprojeler.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "IDARIISLERYETKILI": idariisleryetkili,
        "IKYETKILI": ikyetkili,
        "KULLANICIADISOYADI":
            kullaniciadisoyadi == null ? null : kullaniciadisoyadi,
        "KULLANICIID": kullaniciid == null ? null : kullaniciid,
        "LOGINKODU": loginkodu == null ? null : loginkodu,
        "PERSONELID": personelid == null ? null : personelid,
        "YETKILIPROJELER": yetkiliprojeler == null
            ? null
            : List<dynamic>.from(yetkiliprojeler!.map((x) => x.toMap())),
      };
}

class Yetkiliprojeler {
  Yetkiliprojeler({
    this.projeadi,
    this.projeid,
  });

  final String? projeadi;
  final int? projeid;

  factory Yetkiliprojeler.fromMap(Map<String, dynamic> json) => Yetkiliprojeler(
        projeadi: json["PROJEADI"] == null ? null : json["PROJEADI"],
        projeid: json["PROJEID"] == null ? null : json["PROJEID"],
      );

  Map<String, dynamic> toMap() => {
        "PROJEADI": projeadi == null ? null : projeadi,
        "PROJEID": projeid == null ? null : projeid,
      };
}
