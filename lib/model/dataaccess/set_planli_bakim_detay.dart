import 'dart:convert';
import 'package:falckonfirecommander/model/dataaccess/api_provider.dart';
import 'package:falckonfirecommander/model/entities/bakim_detaylari_list.dart';
import 'package:falckonfirecommander/model/sqlite/database_model.dart';
import 'package:http/http.dart' as http;
import 'package:falckonfirecommander/controller/user_controller.dart';
import 'package:get/get.dart';

Future<dynamic> setPlanliBakimDetaylari(
    // String latitude,
    // String longitude,
    // String guid,
    // String aciklama,
    // int firmaadresid,
    // int kontroldegeribkm,
    // int kullaniciid,
    // int makinetanimid,
    // String planlibakimdetayid,
    // int planlibakimtanimid,
    // DateTime tarih
    ) async {
  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  UserController _userController = Get.find();
  Map<String, dynamic> inputData = {
    "LOGINKODU": _userController.username,
    "SIFRE": _userController.password,
    "PARAMETRELER": {
      // "ENLEM": latitude,
      // "BOYLAM": longitude,
      // "ACIKLAMA": aciklama,
      // "GUID": guid,
      // "FIRMAADRESID": firmaadresid,
      // "KONTROLDEGERIBKM": kontroldegeribkm,
      // "KULLANICIID": kullaniciid,
      // "MAKINETANIMID": makinetanimid,
      // "PLANLIBAKIMDETAYID": planlibakimdetayid,
      // "PLANLIBAKIMTANIMID": planlibakimtanimid,
      // "TARIH": tarih
    }
  };
  var body = json.encode(inputData);
  var url = Uri.parse(ApiProvider.setBakimDetaylari);
  http.Response response = await http.post(url, headers: headers, body: body);
  var resBody = json.decode(response.body);
  var resBodyValues = resBody['Value'];
  print(resBodyValues);
  if (resBody['Message'] == "Success") {
    List<BakimDetaylariList> bakimDetaylariList = [];
    for (var order in resBodyValues) {
      bakimDetaylariList.add(BakimDetaylariList(
        aciklama: order["ACIKLAMA"] ?? "",
        guid: order["GUID"] ?? "",
        sonuc: order["SONUC"] ?? "",
      ));
    }
    _userController.deleteBakimDetaylariList();
    _userController.addListBakimDetaylariList(bakimDetaylariList);
    return (resBodyValues as List).map((e) {
      DBProvider.db.createBakimDetaylariList(BakimDetaylariList.fromMap(e));
    }).toList();
  } else {
    return "İşlem Başarısız";
  }
}
