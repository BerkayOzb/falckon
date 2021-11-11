import 'package:falckonfirecommander/materials/languages.dart';
import 'package:falckonfirecommander/view/adres_page.dart';
import 'package:falckonfirecommander/view/bakim_detaylari_page.dart';
import 'package:falckonfirecommander/view/bakim_tanimlari_page.dart';
import 'package:falckonfirecommander/view/ekipman_tanimlari_page.dart';
import 'package:falckonfirecommander/view/equipment_control_start_page.dart';
import 'package:falckonfirecommander/view/home_page.dart';
import 'package:falckonfirecommander/view/login_page.dart';
import 'package:falckonfirecommander/view/after_scan_page.dart';
import 'package:falckonfirecommander/view/my_requests_page.dart';
import 'package:falckonfirecommander/view/offline_list_page.dart';
import 'package:falckonfirecommander/view/set_bakim_detaylari_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      title: 'Falckon Fire Controller',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      builder: EasyLoading.init(),
      getPages: [
        GetPage(name: '/homepage', page: () => HomePage()),
        GetPage(name: '/homepage2', page: () => HomePageFirst()),
        GetPage(name: '/loginpage', page: () => LoginPage()),
        GetPage(name: '/afterscanpage', page: () => AfterScanPage()),
        GetPage(name: '/equipmentcontrolpage', page: () => EquipmentControl()),
        GetPage(name: '/myrequestspage', page: () => MyRequestsPage()),
        GetPage(name: '/offlinelistpage', page: () => OfflineList()),
        GetPage(name: '/adrespage', page: () => AdresPage()),
        GetPage(
            name: '/ekipmantanimlaripage', page: () => EkipmanTanimlariPage()),
        GetPage(name: '/bakimTanimlariPage', page: () => BakimTanimlariPage()),
        GetPage(name: '/bakimDetaylariPage', page: () => BakimDetaylariPage()),
        GetPage(
            name: '/setBakimDetaylariPage', page: () => SetBakimDetaylariPage())
      ],
    );
  }
}
