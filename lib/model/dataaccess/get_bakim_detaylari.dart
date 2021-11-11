import 'dart:convert';

import 'package:falckonfirecommander/controller/user_controller.dart';
import 'package:falckonfirecommander/model/dataaccess/api_provider.dart';
import 'package:falckonfirecommander/model/entities/bakim_detaylari.dart';
import 'package:falckonfirecommander/model/sqlite/database_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getBakimDetaylari() async {
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
  var url = Uri.parse(ApiProvider.bakimDetaylari);
  http.Response response = await http.post(url, headers: headers, body: body);
  var resBody = json.decode(response.body);
  var resBodyValues = resBody['Value'];
  print(resBodyValues);
  if (resBody['Message'] == "Success") {
    List<BakimDetaylari> bakimDetaylari = [];
    for (var order in resBodyValues) {
      bakimDetaylari.add(BakimDetaylari(
        bakimistanimadi: order["BAKIMISTANIMADI"] ?? "",
        bakimislemkodu: order["BAKIMISLEMKODU"] ?? "",
        planlibakimdetayid: order["PLANLIBAKIMDETAYID"],
        bakimistanimid: order["BAKIMISTANIMID"],
        planlibakimtanimid: order["PLANLIBAKIMTANIMID"],
      ));
    }
    _userController.addListBakimDetaylar(bakimDetaylari);
    return (resBodyValues as List).map((e) {
      DBProvider.db.createBakimDetayList(BakimDetaylari.fromMap(e));
    }).toList();
  } else {
    return "İşlem Başarısız";
  }
}
