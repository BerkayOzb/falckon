import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:falckonfirecommander/controller/user_controller.dart';

Future<bool> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.delete<UserController>();
  prefs.remove('username');
  prefs.remove('password');
  return true;
}
