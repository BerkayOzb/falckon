import 'dart:convert';

import 'package:falckonfirecommander/controller/user_controller.dart';
import 'package:falckonfirecommander/model/dataaccess/api_provider.dart';
import 'package:falckonfirecommander/model/entities/bakim_tanimlari.dart';
import 'package:falckonfirecommander/model/sqlite/database_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getBakimTanimlari() async {
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
  var url = Uri.parse(ApiProvider.bakimTanimlari);
  http.Response response = await http.post(url, headers: headers, body: body);
  var resBody = json.decode(response.body);
  var resBodyValues = resBody['Value'];
  print(resBodyValues);
  if (resBody['Message'] == "Success") {
    List<BakimTanimlari> tanimlar = [];
    for (var order in resBodyValues) {
      tanimlar.add(BakimTanimlari(
        bakimperiyotadi: order["BAKIMPERIYOTADI"] ?? "",
        planlibakimkatalogid: order["PLANLIBAKIMKATALOGID"],
        kayitsirano: order["KAYITSIRANO"],
        bakimperiyotid: order["BAKIMPERIYOTID"],
        planlibakimtanimid: order["PLANLIBAKIMTANIMID"],
      ));
    }
    _userController.addListBakimTanimlar(tanimlar);
    return (resBodyValues as List).map((e) {
      DBProvider.db.createBakimTanimList(BakimTanimlari.fromMap(e));
    }).toList();
  } else {
    return "İşlem Başarısız";
  }
}
