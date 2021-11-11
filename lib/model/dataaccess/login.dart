import 'package:falckonfirecommander/controller/user_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:falckonfirecommander/model/dataaccess/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool?> logincheck(
    bool? value, String? username, String? password) async {
  if (value!) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username!);
    prefs.setString('password', password!);
  }

  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  Map<String, dynamic> inputData = {
    "LOGINKODU": username,
    "SIFRE": password,
    "PARAMETRELER": {}
  };
  var body = json.encode(inputData);
  var url = Uri.parse(ApiProvider.getUser);
  http.Response response = await http.post(url, headers: headers, body: body);
  if (response.body.isNotEmpty) {
    var resBody = json.decode(response.body);
    print(resBody);
    if (resBody['Message'] == "Başarılı") {
      Get.put(UserController(username, password));
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
