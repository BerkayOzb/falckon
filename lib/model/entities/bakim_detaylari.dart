import 'dart:convert';

List<BakimDetaylari> bakimDetaylariFromMap(String str) => List<BakimDetaylari>.from(
    json.decode(str).map((x) => BakimDetaylari.fromMap(x)));

String bakimDetaylariToMap(List<BakimDetaylari> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class BakimDetaylari {
  BakimDetaylari({
    this.bakimislemkodu,
    this.bakimistanimadi,
    this.bakimistanimid,
    this.planlibakimdetayid,
    this.planlibakimtanimid,
  });

  final String? bakimislemkodu;
  final String? bakimistanimadi;
  final int? bakimistanimid;
  final int? planlibakimdetayid;
  final int? planlibakimtanimid;

  factory BakimDetaylari.fromMap(Map<String, dynamic> json) => BakimDetaylari(
        bakimislemkodu:
            json["BAKIMISLEMKODU"] == null ? null : json["BAKIMISLEMKODU"],
        bakimistanimadi:
            json["BAKIMISTANIMADI"] == null ? null : json["BAKIMISTANIMADI"],
        bakimistanimid:
            json["BAKIMISTANIMID"] == null ? null : json["BAKIMISTANIMID"],
        planlibakimdetayid: json["PLANLIBAKIMDETAYID"] == null
            ? null
            : json["PLANLIBAKIMDETAYID"],
        planlibakimtanimid: json["PLANLIBAKIMTANIMID"] == null
            ? null
            : json["PLANLIBAKIMTANIMID"],
      );

  Map<String, dynamic> toMap() => {
        "BAKIMISLEMKODU": bakimislemkodu == null ? null : bakimislemkodu,
        "BAKIMISTANIMADI": bakimistanimadi == null ? null : bakimistanimadi,
        "BAKIMISTANIMID": bakimistanimid == null ? null : bakimistanimid,
        "PLANLIBAKIMDETAYID":
            planlibakimdetayid == null ? null : planlibakimdetayid,
        "PLANLIBAKIMTANIMID":
            planlibakimtanimid == null ? null : planlibakimtanimid,
      };
}
