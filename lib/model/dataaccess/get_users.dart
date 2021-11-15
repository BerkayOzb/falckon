import 'dart:convert';

import 'package:falckonfirecommander/controller/user_controller.dart';
import 'package:falckonfirecommander/model/dataaccess/api_provider.dart';
import 'package:falckonfirecommander/model/entities/kullanici.dart';
import 'package:falckonfirecommander/model/sqlite/database_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getUserValues() async {
  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  UserController _userController = Get.find();
  Map<String, dynamic> inputData = {
    "LOGINKODU": _userController.username,
    "SIFRE": _userController.password,
    "PARAMETRELER": {}
  };
  var body = json.encode(inputData);
  var url = Uri.parse(ApiProvider.getUser);
  http.Response response = await http.post(url, headers: headers, body: body);
  var resBody = json.decode(response.body);
  var resBodyValues = resBody['Value'];
  print(resBodyValues);
  if (resBody['Message'] == "Başarılı") {
    List<Kullanici> kullanicilar = [];
    List<Yetkiliprojeler> yetkiliprojeler = [];
    for (var order in resBodyValues) {
      yetkiliprojeler.add(Yetkiliprojeler(
        projeadi: order["PROJEADI"] ?? "",
        projeid: order["PROJEID"],
      ));
    }
    for (var order in resBodyValues) {
      kullanicilar.add(Kullanici(
        kullaniciadisoyadi: order["KULLANICIADISOYADI"] ?? "",
        kullaniciid: order["KULLANICID"] ,
        loginkodu: order["LOGINKODU"] ?? "",
        personelid: order["PERSONELID"] ,
        idariisleryetkili: order["IDARIISLERYETKILI"] ?? "",
        ikyetkili: order["IKYETKILI"] ?? "",
        yetkiliprojeler: yetkiliprojeler,
      ));
    }
    _userController.deleteKullanici();
    _userController.addListKullanici(kullanicilar);
    return (resBodyValues as List).map((e) {
      DBProvider.db.createKullaniciList(Kullanici.fromMap(e));
    }).toList();
  } else {
    return "İşlem Başarısız";
  }
}
