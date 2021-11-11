import 'package:falckonfirecommander/materials/buttons.dart';

import 'package:falckonfirecommander/materials/colors.dart';
import 'package:falckonfirecommander/materials/offlinecard.dart';
import 'package:falckonfirecommander/model/entities/listitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfflineList extends StatefulWidget {
  OfflineList({Key? key}) : super(key: key);

  @override
  _OfflineListState createState() => _OfflineListState();
}

class _OfflineListState extends State<OfflineList> {
  List<KayitListesi> listitem = List.generate(
    30,
    (index) => KayitListesi(
        ustYazi: 'SCBA',
        ofis: 'FALCKON OFİS-DM-02',
        alet: 'TEMİZ HAVA TÜPLÜ SOLUNUM SETİ',
        tarih: '25.02.2020 17:41:35 : ${index + 1}',
        durum: 'Daha Önceden Aktarılmıştır : ${index + 1}'),
  );
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
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'ÇEVRİMDIŞI KAYIT LİSTESİ',
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
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      return OfflineKayitCard(
                        listitem: listitem[index],
                      );
                    },
                    itemCount: listitem.length,
                  ),
                ),
              ),
              OfflineButton(
                textValue: 'ÇEVİRMDIŞI KAYITLARI YÜKLE',
                method: () {},
                renk: Color(AppColors.secondarycolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
