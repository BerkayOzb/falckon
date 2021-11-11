import 'package:falckonfirecommander/controller/scanner.dart';
import 'package:falckonfirecommander/materials/buttons.dart';
import 'package:falckonfirecommander/model/dataaccess/logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:falckonfirecommander/materials/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScannerContraller _scannerContraller = Get.put(ScannerContraller());
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
            'EKİPMAN KONTROL YÖNETİMİ',
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
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => HomePageButton(
                  textValue: _scannerContraller.tValue.value,
                  method: () {
                    Get.toNamed('/afterscanpage');
                  },
                  icon: Icon(
                    Icons.qr_code,
                    color: Color(AppColors.whitetextcolor),
                  )),
            ),
            HomePageButton(
                textValue: 'ÇEVRİMDIŞI KAYITLAR',
                method: () {
                  Get.toNamed('/myrequestspage');
                },
                icon: Icon(
                  Icons.wifi_off,
                  color: Color(AppColors.whitetextcolor),
                ))
          ],
        )),
      ),
    );
  }
}

class HomePageFirst extends StatefulWidget {
  const HomePageFirst({Key? key}) : super(key: key);

  @override
  State<HomePageFirst> createState() => _HomePageFirstState();
}

class _HomePageFirstState extends State<HomePageFirst> {
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
            'ANA SAYFA',
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
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomePageButton(
                textValue: 'EKİPMAN KONTROL YÖNETİMİ',
                method: () {
                  Get.toNamed('/homepage');
                },
                icon: Icon(
                  Icons.check_circle,
                  color: Color(AppColors.whitetextcolor),
                ))
          ],
        )),
      ),
    );
  }
}
