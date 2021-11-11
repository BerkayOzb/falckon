import 'package:flutter/painting.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:falckonfirecommander/controller/checkbox_controller.dart';
import 'package:falckonfirecommander/model/dataaccess/login.dart';
import 'package:falckonfirecommander/materials/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:falckonfirecommander/materials/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final CheckBoxController _checkboxController = Get.put(CheckBoxController());
  String? _username;
  String? _password;
  bool? checkbox;
  final _formKey = GlobalKey<FormState>();
  Future<Map<String?, String?>?> valuecheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('username');
    String? password = prefs.getString('password');
    if (name == null || password == null) {
      return null;
    } else {
      return {'username': name, 'password': password};
    }
  }

  @override
  void initState() {
    super.initState();
    valuecheck().then((value) {
      if (value != null) {
        EasyLoading.show(status: 'Giriş Yapılıyor', dismissOnTap: true);
        logincheck(checkbox, value['username'], value['password'])
            .then((value) {
          if (value!) {
            EasyLoading.showSuccess('Giriş Başarılı',
                duration: Duration(seconds: 2), dismissOnTap: true);
            Get.toNamed('/homepage2');
          } else {
            EasyLoading.showError('Giriş Başarısız',
                duration: Duration(seconds: 2), dismissOnTap: true);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    checkbox = _checkboxController.checkboxValuelogin.value;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'compname'.tr,
            style: TextStyle(
                color: Color(AppColors.blacktextcolor),
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(AppColors.themecolor),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: Color(AppColors.themecolor),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(20),
                  width: Get.width * 0.95,
                  height: Get.height * 0.4,
                  child: FittedBox(
                    child: Image.asset('assets/company_logo/falckonlogo.jpeg'),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  color: Color(AppColors.themecolor),
                  width: Get.width * 0.8,
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width * 0.8,
                            child: TextFormField(
                              onSaved: (value) {
                                _username = value;
                              },
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(AppColors.blacktextcolor)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(AppColors.blacktextcolor)),
                                ),
                                labelStyle: TextStyle(
                                    color: Color(AppColors.blacktextcolor),
                                    fontWeight: FontWeight.bold),
                                labelText: 'user'.tr,
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.8,
                            child: TextFormField(
                              obscureText: true,
                              onSaved: (value) {
                                _password = value;
                              },
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(AppColors.blacktextcolor)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(AppColors.blacktextcolor)),
                                ),
                                labelText: 'password'.tr,
                                labelStyle: TextStyle(
                                    color: Color(AppColors.blacktextcolor),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Obx(() => Theme(
                                data: ThemeData(
                                    unselectedWidgetColor:
                                        Color(AppColors.blacktextcolor)),
                                child: CheckboxListTile(
                                  activeColor: Color(AppColors.blacktextcolor),
                                  contentPadding: EdgeInsets.all(0),
                                  onChanged: (bool? value) {
                                    _checkboxController
                                        .checkboxLoginvalueChange();
                                    checkbox = value;
                                  },
                                  title: Text(
                                    'remember_me'.tr,
                                    style: TextStyle(
                                        color: Color(AppColors.blacktextcolor),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: _checkboxController
                                      .checkboxValuelogin.value,
                                ),
                              )),
                          Container(
                            width: Get.width * 0.5,
                            child: ClassicButton(
                                textValue: 'sign_in'.tr,
                                method: () {
                                  _formKey.currentState!.save();
                                  Future<bool?> value = logincheck(
                                      checkbox, _username, _password);
                                  EasyLoading.show(status: 'Giriş Yapılıyor');
                                  value.then((value) {
                                    if (value!) {
                                      EasyLoading.showSuccess('Giriş Başarılı',
                                          duration: Duration(seconds: 2),
                                          dismissOnTap: true);
                                      Get.toNamed('/homepage2');
                                    } else {
                                      EasyLoading.showError('Giriş Başarısız',
                                          duration: Duration(seconds: 2),
                                          dismissOnTap: true);
                                    }
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
