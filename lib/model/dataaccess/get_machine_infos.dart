import 'dart:convert';
import 'package:falckonfirecommander/model/entities/ekipman.dart';
import 'package:falckonfirecommander/model/dataaccess/api_provider.dart';
import 'package:falckonfirecommander/model/sqlite/database_model.dart';
import 'package:http/http.dart' as http;
import 'package:falckonfirecommander/controller/user_controller.dart';
import 'package:get/get.dart';

Future<dynamic> getEquipmentValues() async {
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
  var url = Uri.parse(ApiProvider.machineInfo);
  http.Response response = await http.post(url, headers: headers, body: body);
  var resBody = json.decode(response.body);
  var resBodyValues = resBody['Value'];
  print(resBodyValues);
  if (resBody['Message'] == "Success") {
    List<Ekipman> ekipmanlar = [];
    for (var order in resBodyValues) {
      ekipmanlar.add(Ekipman(
          aciklama: order["ACIKLAMA"] ?? "",
          kontrolsekliadi: order["KONTROLSEKLIADI"] ?? "",
          makineadi: order["MAKINEADI"] ?? "",
          makinekodu: order["MAKINEKODU"] ?? "",
          makinemarkaadi: order["MAKINEMARKAADI"] ?? "",
          makinemodeladi: order["MAKINEMODELADI"] ?? "",
          makinetipadi: order["MAKINETIPADI"] ?? ""));
    }
    _userController.deleteEkipman();
    _userController.addListEkipman(ekipmanlar);
    return (resBodyValues as List).map((e) {
      DBProvider.db.createEkipmanList(Ekipman.fromMap(e));
    }).toList();
  } else {
    return "İşlem Başarısız";
  }
}
