import 'package:falckonfirecommander/controller/checkbox_controller.dart';
import 'package:falckonfirecommander/materials/buttons.dart';
import 'package:falckonfirecommander/materials/cardsDetailed.dart';
import 'package:falckonfirecommander/model/dataaccess/logout.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:falckonfirecommander/materials/colors.dart';

class EquipmentControl extends StatefulWidget {
  const EquipmentControl({Key? key}) : super(key: key);

  @override
  State<EquipmentControl> createState() => _EquipmentControlState();
}

class _EquipmentControlState extends State<EquipmentControl> {
  final CheckBoxController _checkboxController = Get.find();
  bool? checkbox1;
  bool? checkbox2;
  bool? checkbox3;
  bool? checkbox4;
  bool? checkbox5;
  bool? checkbox6;
  bool? checkbox7;
  bool? checkbox8;
  bool? checkbox9;
  bool? checkbox10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  logout();
                  Get.toNamed('/loginpage');
                },
                child: Text(
                  'Çıkış Yap',
                  style: TextStyle(
                      color: Color(AppColors.blacktextcolor), fontSize: 15),
                ))
          ],
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'EKİPMAN KONTROL BİLGİLERİ',
              style: TextStyle(
                  color: Color(AppColors.blacktextcolor),
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Color(AppColors.themecolor),
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            color: Color(AppColors.blacktextcolor),
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
        ),
        backgroundColor: Color(AppColors.themecolor),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Color(AppColors.secondarycolor),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RequestPageDetailed2(
                      title: 'EKİPMAN', value: 'How is it look'),
                  RequestPageDropdownDet(
                    hintValue: 'Kontrol Türü Seçiniz',
                    title: 'KONTROL',
                    items: <String>[
                      'Aylık Kontrol',
                      'Yıllık Kontrol',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  RequestPageDetailed2(
                      title: 'KONTROL TARİHİ', value: 'How is it look'),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'KONTROL DETAYLARI',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Color(AppColors.blacktextcolor)),
                          child: CheckboxListTile(
                            activeColor: Color(AppColors.blacktextcolor),
                            onChanged: (bool? value) {
                              _checkboxController.checkboxValueEq1Change();
                              checkbox1 = value;
                            },
                            title: Text(
                              'Hava Basıncı Düşük (Min:270 Bar)',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(AppColors.blacktextcolor),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: _checkboxController
                                .checkboxValueEqControl1.value,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Color(AppColors.blacktextcolor)),
                          child: CheckboxListTile(
                            activeColor: Color(AppColors.blacktextcolor),
                            onChanged: (bool? value) {
                              _checkboxController.checkboxValueEq2Change();
                              checkbox2 = value;
                            },
                            title: Text(
                              'Maske başlık kayışı kopuk',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(AppColors.blacktextcolor),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: _checkboxController
                                .checkboxValueEqControl2.value,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Color(AppColors.blacktextcolor)),
                          child: CheckboxListTile(
                            activeColor: Color(AppColors.blacktextcolor),
                            onChanged: (bool? value) {
                              _checkboxController.checkboxValueEq3Change();
                              checkbox3 = value;
                            },
                            title: Text(
                              'Maske vizörü kırık',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(AppColors.blacktextcolor),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: _checkboxController
                                .checkboxValueEqControl3.value,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Color(AppColors.blacktextcolor)),
                          child: CheckboxListTile(
                            activeColor: Color(AppColors.blacktextcolor),
                            onChanged: (bool? value) {
                              _checkboxController.checkboxValueEq4Change();
                              checkbox4 = value;
                            },
                            title: Text(
                              'Regülatör arızalı',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(AppColors.blacktextcolor),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: _checkboxController
                                .checkboxValueEqControl4.value,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Color(AppColors.blacktextcolor)),
                          child: CheckboxListTile(
                            activeColor: Color(AppColors.blacktextcolor),
                            onChanged: (bool? value) {
                              _checkboxController.checkboxValueEq5Change();
                              checkbox5 = value;
                            },
                            title: Text(
                              'İstem vanası arızalı',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(AppColors.blacktextcolor),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: _checkboxController
                                .checkboxValueEqControl5.value,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Color(AppColors.blacktextcolor)),
                          child: CheckboxListTile(
                            activeColor: Color(AppColors.blacktextcolor),
                            onChanged: (bool? value) {
                              _checkboxController.checkboxValueEq6Change();
                              checkbox6 = value;
                            },
                            title: Text(
                              'Taşıma çantası kırık',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(AppColors.blacktextcolor),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: _checkboxController
                                .checkboxValueEqControl6.value,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Color(AppColors.blacktextcolor)),
                          child: CheckboxListTile(
                            activeColor: Color(AppColors.blacktextcolor),
                            onChanged: (bool? value) {
                              _checkboxController.checkboxValueEq7Change();
                              checkbox7 = value;
                            },
                            title: Text(
                              'Askı kayış tokaları kırık',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(AppColors.blacktextcolor),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: _checkboxController
                                .checkboxValueEqControl7.value,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(AppColors.whitetextcolor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Color(AppColors.blacktextcolor)),
                          child: CheckboxListTile(
                            activeColor: Color(AppColors.blacktextcolor),
                            onChanged: (bool? value) {
                              _checkboxController.checkboxValueEq8Change();
                              checkbox8 = value;
                            },
                            title: Text(
                              'Tüp vanası arızalı',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(AppColors.blacktextcolor),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: _checkboxController
                                .checkboxValueEqControl8.value,
                          ),
                        )),
                  ),
                  DetPage(
                      widthh: Get.width,
                      textValue: 'KAYDET',
                      method: () {},
                      icon: Icon(Icons.save))
                ],
              ),
            ),
          ),
        ));
  }
}
