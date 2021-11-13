import 'dart:convert';
import 'package:falckonfirecommander/controller/user_controller.dart';
import 'package:falckonfirecommander/model/dataaccess/api_provider.dart';
import 'package:falckonfirecommander/model/entities/adres.dart';
import 'package:falckonfirecommander/model/sqlite/database_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getFirmaAdres() async {
  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  UserController _userController = Get.find();

  Map<String, dynamic> inputData = {
    "LOGINKODU": _userController.username,
    "SIFRE": _userController.password,
    "PARAMETRELER": {"FIRMATANIMID": "1"}
  };
  var body = json.encode(inputData);
  var url = Uri.parse(ApiProvider.firmaAdres);
  http.Response response = await http.post(url, headers: headers, body: body);
  var resBody = json.decode(response.body);
  var resBodyValues = resBody['Value'];
  print(resBodyValues);

  if (resBody['Message'] == "Success") {
    List<Adres> adresler = [];
    for (var order in resBodyValues) {
      adresler.add(Adres(
        adres: order["ADRES"] ?? "",
        adrestipid: order["ADRESTIPID"],
        adreskodu: order["ADRESKODU"] ?? "",
        firmatanimid: order["FIRMATANIMID"],
        firmaadresid: order["FIRMAADRESID"],
        projeid: order["PROJEID"],
        adrestipadi: order["ADRESTIPADI"] ?? "",
      ));
    }
    _userController.deleteAdresler();
    _userController.addListAdresler(adresler);
    return (resBodyValues as List).map((e) {
      DBProvider.db.createAdresList(Adres.fromMap(e));
    }).toList();
  } else {
    return "İşlem Başarısız";
  }
}
