//import 'package:falckonfirecommander/controller/scanner.dart';
import 'package:falckonfirecommander/controller/scanner.dart';
import 'package:falckonfirecommander/materials/buttons.dart';
import 'package:falckonfirecommander/materials/cardsDetailed.dart';
import 'package:falckonfirecommander/model/dataaccess/logout.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:falckonfirecommander/materials/colors.dart';

import 'package:falckonfirecommander/materials/DropDownButtons.dart';

class AfterScanPage extends StatefulWidget {
  const AfterScanPage({Key? key}) : super(key: key);

  @override
  State<AfterScanPage> createState() => _AfterScanPage();
}

class _AfterScanPage extends State<AfterScanPage> {
  final ScannerContraller _scannerContraller = Get.find();

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
            'EKİPMAN DETAY',
            style: TextStyle(
                fontFamily: 'OpenSans',
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
            child: Scrollbar(
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
                  DetPage(
                      textValue: 'TARAMA YAP',
                      widthh: Get.width,
                      method: () {
                        _scannerContraller.scan();
                      },
                      icon: Icon(
                        Icons.qr_code,
                      )),
                  DetPage(
                      textValue: 'BULUNDUĞU YERİ GÜNCELLE',
                      widthh: Get.width,
                      method: () {},
                      icon: Icon(Icons.location_on)),
                  DetPage(
                      widthh: Get.width,
                      textValue: 'EKİPMAN KONTROL BAŞLAT',
                      method: () {
                        Get.toNamed('/equipmentcontrolpage');
                      },
                      icon: Icon(Icons.trending_up)),
                  Obx(() => RequestPageDetailed2(
                      title: 'KODU', value: _scannerContraller.data.value)),
                  RequestPageDetailed2(title: 'ADI', value: 'How is it look'),
                  RequestPageDetailed2(title: 'TİP', value: 'How is it look'),
                  RequestPageDetailed2(title: 'MARKA', value: 'How is it look'),
                  RequestPageDetailed2(title: 'MODEL', value: 'How is it look'),
                  RequestPageDetailed2(
                      title: 'ÜRETİM TARİHİ', value: 'How is it look'),
                  RequestPageDetailed2(
                      title: 'DOLUM TARİHİ', value: 'How is it look'),
                  RequestPageDetailed2(
                      title: 'KONTROL TARİHİ', value: 'How is it look'),
                  RequestPageDetailed2(
                      title: 'MİLADI', value: 'How is it look'),
                  RequestPageDetailed2(
                      title: 'BULUNDUĞU YER', value: 'How is it look'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}