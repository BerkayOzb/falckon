import 'package:falckonfirecommander/controller/scanner.dart';
import 'package:falckonfirecommander/materials/buttons.dart';

import 'package:falckonfirecommander/model/dataaccess/get_bakim_detaylari.dart';
import 'package:falckonfirecommander/model/dataaccess/get_bakim_tanimlari.dart';
import 'package:falckonfirecommander/model/dataaccess/get_firma_adres.dart';
import 'package:falckonfirecommander/model/dataaccess/get_machine_infos.dart';
import 'package:falckonfirecommander/model/dataaccess/get_users.dart';
import 'package:falckonfirecommander/model/dataaccess/set_planli_bakim_detay.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:falckonfirecommander/materials/colors.dart';

import 'package:falckonfirecommander/materials/DropDownButtons.dart';

class MyRequestsPage extends StatefulWidget {
  const MyRequestsPage({Key? key}) : super(key: key);

  @override
  State<MyRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> {
  final ScannerContraller _scannerContraller = Get.find();
  int value = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 30,
                color: Color(AppColors.blacktextcolor),
              ))
        ],
        centerTitle: true,
        title: Text(
          'ÇEVRİMDIŞI KAYITLAR',
          style: TextStyle(
              fontFamily: 'OpenSans',
              color: Color(AppColors.blacktextcolor),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(AppColors.themecolor),
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          color: Color(AppColors.blacktextcolor),
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30,
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Color(AppColors.themecolor),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          //margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Visibility(
                visible: false,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search', border: InputBorder.none),
                        ),
                        trailing: FilterCard(),
                      ),
                    ),
                  ),
                ),
              ),
              OfflineButton(
                textValue: 'KULLANICILARI İNDİR' + ' ' + '($value)',
                method: () async {
                  EasyLoading.show(status: 'İndiriliyor');
                  Future<dynamic> x = getUserValues();
                  x.then((value) {
                    if (value == 'İşlem Başarısız') {
                      EasyLoading.showError('İndirme Başarısız',
                          duration: Duration(seconds: 2), dismissOnTap: true);
                    } else {
                      EasyLoading.dismiss();
                      print(value);
                    }
                  });
                },
                renk: Color(AppColors.secondarycolor),
              ),
              OfflineButton(
                textValue: 'EKİPMAN TANIMLARI İNDİR' + ' ' + '($value)',
                method: () async {
                  EasyLoading.show(status: 'İndiriliyor');
                  Future<dynamic> x = getEquipmentValues();
                  x.then((value) {
                    if (value == 'İşlem Başarısız') {
                      EasyLoading.showError('İndirme Başarısız',
                          duration: Duration(seconds: 2), dismissOnTap: true);
                    } else {
                      EasyLoading.dismiss();
                      print(value);
                      Get.toNamed('/ekipmantanimlaripage');
                    }
                  });
                },
                renk: Color(AppColors.secondarycolor),
              ),
              OfflineButton(
                textValue: 'FİRMA ADRESİ İNDİR' + ' ' + '($value)',
                method: () async {
                  EasyLoading.show(status: 'İndiriliyor');
                  Future<dynamic> x = getFirmaAdres();
                  x.then((value) {
                    if (value == 'İşlem Başarısız') {
                      EasyLoading.showError('İndirme Başarısız',
                          duration: Duration(seconds: 2), dismissOnTap: true);
                    } else {
                      EasyLoading.dismiss();
                      print(value);
                      Get.toNamed('/adrespage');
                    }
                  });
                },
                renk: Color(AppColors.secondarycolor),
              ),
              OfflineButton(
                textValue: 'BAKIM TANIMLARI İNDİR' + ' ' + '($value)',
                method: () async {
                  EasyLoading.show(status: 'İndiriliyor');
                  Future<dynamic> x = getBakimTanimlari();
                  x.then((value) {
                    if (value == 'İşlem Başarısız') {
                      EasyLoading.showError('İndirme Başarısız',
                          duration: Duration(seconds: 2), dismissOnTap: true);
                    } else {
                      EasyLoading.dismiss();
                      print(value);
                      Get.toNamed('/bakimTanimlariPage');
                    }
                  });
                },
                renk: Color(AppColors.secondarycolor),
              ),
              OfflineButton(
                textValue: 'BAKIM DETAYLARI İNDİR' + ' ' + '($value)',
                method: () {
                  EasyLoading.show(status: 'İndiriliyor');
                  Future<dynamic> x = getBakimDetaylari();
                  x.then((value) {
                    if (value == 'İşlem Başarısız') {
                      EasyLoading.showError('İndirme Başarısız',
                          duration: Duration(seconds: 2), dismissOnTap: true);
                    } else {
                      EasyLoading.dismiss();
                      print(value);
                      Get.toNamed('/bakimDetaylariPage');
                    }
                  });
                },
                renk: Color(AppColors.secondarycolor),
              ),
              Visibility(
                visible: true,
                child: OfflineButton(
                  textValue: 'SET BAKIM DETAYLARI ' + ' ' + '($value)',
                  method: () {
                    EasyLoading.show(status: 'İndiriliyor');
                    Future<dynamic> x = setPlanliBakimDetaylari();
                    x.then((value) {
                      if (value == 'İşlem Başarısız') {
                        EasyLoading.showError('İndirme Başarısız',
                            duration: Duration(seconds: 2), dismissOnTap: true);
                      } else {
                        EasyLoading.dismiss();
                        print(value);
                        Get.toNamed('/setBakimDetaylariPage');
                      }
                    });
                  },
                  renk: Color(AppColors.secondarycolor),
                ),
              ),
              OfflineButton(
                  textValue: 'ÇEVRİMDIŞI KAYITLARI YÜKLE' + ' ' + '($value)',
                  method: () async {},
                  renk: Colors.green.shade500),
              OfflineButton(
                  textValue: 'ÇEVRİMDIŞI KAYIT LİSTESİ' + ' ' + '($value)',
                  method: () {
                    Get.toNamed('/offlinelistpage');
                  },
                  renk: Colors.green.shade500),
              Flexible(
                child: Center(
                  child: Obx(() => Text(_scannerContraller.data.value)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
