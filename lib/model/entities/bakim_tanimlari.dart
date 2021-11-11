import 'dart:convert';

List<BakimTanimlari> bakimTanimlariFromMap(String str) =>
    List<BakimTanimlari>.from(
        json.decode(str).map((x) => BakimTanimlari.fromMap(x)));

String bakimTanimlariToMap(List<BakimTanimlari> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class BakimTanimlari {
  BakimTanimlari({
    this.bakimperiyotadi,
    this.bakimperiyotid,
    this.kayitsirano,
    this.planlibakimkatalogid,
    this.planlibakimtanimid,
  });

  final String? bakimperiyotadi;
  final int? bakimperiyotid;
  final int? kayitsirano;
  final int? planlibakimkatalogid;
  final int? planlibakimtanimid;

  factory BakimTanimlari.fromMap(Map<String, dynamic> json) => BakimTanimlari(
        bakimperiyotadi:
            json["BAKIMPERIYOTADI"] == null ? null : json["BAKIMPERIYOTADI"],
        bakimperiyotid:
            json["BAKIMPERIYOTID"] == null ? null : json["BAKIMPERIYOTID"],
        kayitsirano: json["KAYITSIRANO"] == null ? null : json["KAYITSIRANO"],
        planlibakimkatalogid: json["PLANLIBAKIMKATALOGID"] == null
            ? null
            : json["PLANLIBAKIMKATALOGID"],
        planlibakimtanimid: json["PLANLIBAKIMTANIMID"] == null
            ? null
            : json["PLANLIBAKIMTANIMID"],
      );

  Map<String, dynamic> toMap() => {
        "BAKIMPERIYOTADI": bakimperiyotadi == null ? null : bakimperiyotadi,
        "BAKIMPERIYOTID": bakimperiyotid == null ? null : bakimperiyotid,
        "KAYITSIRANO": kayitsirano == null ? null : kayitsirano,
        "PLANLIBAKIMKATALOGID":
            planlibakimkatalogid == null ? null : planlibakimkatalogid,
        "PLANLIBAKIMTANIMID":
            planlibakimtanimid == null ? null : planlibakimtanimid,
      };
}
