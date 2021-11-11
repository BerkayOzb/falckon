import 'dart:convert';

List<Adres> adresFromMap(String str) =>
    List<Adres>.from(json.decode(str).map((x) => Adres.fromMap(x)));

String adresToMap(List<Adres> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Adres {
  Adres({
    this.adres,
    this.adreskodu,
    this.adrestipadi,
    this.adrestipid,
    this.firmaadresid,
    this.firmatanimid,
    this.projeid,
  });

  final String? adres;
  final String? adreskodu;
  final String? adrestipadi;
  final int? adrestipid;
  final int? firmaadresid;
  final int? firmatanimid;
  final int? projeid;

  factory Adres.fromMap(Map<String, dynamic> json) => Adres(
        adres: json["ADRES"] == null ? null : json["ADRES"],
        adreskodu: json["ADRESKODU"] == null ? null : json["ADRESKODU"],
        adrestipadi: json["ADRESTIPADI"] == null ? null : json["ADRESTIPADI"],
        adrestipid: json["ADRESTIPID"] == null ? null : json["ADRESTIPID"],
        firmaadresid:
            json["FIRMAADRESID"] == null ? null : json["FIRMAADRESID"],
        firmatanimid:
            json["FIRMATANIMID"] == null ? null : json["FIRMATANIMID"],
        projeid: json["PROJEID"] == null ? null : json["PROJEID"],
      );

  Map<String, dynamic> toMap() => {
        "ADRES": adres == null ? null : adres,
        "ADRESKODU": adreskodu == null ? null : adreskodu,
        "ADRESTIPADI": adrestipadi == null ? null : adrestipadi,
        "ADRESTIPID": adrestipid == null ? null : adrestipid,
        "FIRMAADRESID": firmaadresid == null ? null : firmaadresid,
        "FIRMATANIMID": firmatanimid == null ? null : firmatanimid,
        "PROJEID": projeid == null ? null : projeid,
      };
}
