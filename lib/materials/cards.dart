import 'package:falckonfirecommander/materials/cardsDetailed.dart';
import 'package:falckonfirecommander/model/entities/adres.dart';
import 'package:falckonfirecommander/model/entities/bakim_detaylari.dart';
import 'package:falckonfirecommander/model/entities/bakim_detaylari_list.dart';
import 'package:falckonfirecommander/model/entities/bakim_tanimlari.dart';
import 'package:falckonfirecommander/model/entities/ekipman.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:falckonfirecommander/materials/buttons.dart';

import 'package:falckonfirecommander/materials/colors.dart';

class HomePageCardTemplate extends StatelessWidget {
  const HomePageCardTemplate(
      {Key? key,
      required this.title,
      required this.methodRequest,
      required this.methodApproval})
      : super(key: key);
  final String title;
  final methodRequest;
  final methodApproval;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(AppColors.secondarycolor),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0), borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        child: Center(
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  iconSize: 35,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.assignment),
                  color: Color(AppColors.whitetextcolor),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 35,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.av_timer),
                  color: Color(AppColors.whitetextcolor),
                  onPressed: () {},
                ),
              ],
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(AppColors.whitetextcolor),
                  fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: Get.height * 0.13,
                      child: HomePageButton(
                          icon: Icon(
                            Icons.assignment,
                            color: Color(AppColors.blacktextcolor),
                          ),
                          textValue: 'myrequests'.tr,
                          method: methodRequest),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: Get.height * 0.13,
                      child: HomePageButton(
                          icon: Icon(
                            Icons.av_timer,
                            color: Color(AppColors.blacktextcolor),
                          ),
                          textValue: 'waitforpermission'.tr,
                          method: methodApproval),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AfterScanTemp extends StatefulWidget {
  const AfterScanTemp({
    Key? key,
  }) : super(key: key);

  @override
  State<AfterScanTemp> createState() => _AfterScanTemp();
}

class _AfterScanTemp extends State<AfterScanTemp> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(AppColors.secondarycolor),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(vertical: 0),
          title: Text(
            'widget',
            style: TextStyle(
                fontSize: 20,
                color: Color(AppColors.whitetextcolor),
                fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdresCard extends StatefulWidget {
  const AdresCard({Key? key, required this.adresIstek}) : super(key: key);
  final Adres adresIstek;

  @override
  _AdresCardState createState() => _AdresCardState();
}

class _AdresCardState extends State<AdresCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Color(AppColors.secondarycolor),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.adresIstek.adres!,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(AppColors.whitetextcolor),
                  fontWeight: FontWeight.bold),
            ),
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  RequestPageDetailed2(
                      title: 'Code', value: widget.adresIstek.adreskodu!),
                  RequestPageDetailed2(
                      title: 'Adres Tip ID',
                      value: widget.adresIstek.adrestipid.toString()),
                  RequestPageDetailed2(
                      title: 'Tanım ID',
                      value: widget.adresIstek.firmatanimid.toString()),
                  RequestPageDetailed2(
                      title: 'Adres ID',
                      value: widget.adresIstek.firmaadresid.toString()),
                  RequestPageDetailed2(
                      title: 'Proje ID',
                      value: widget.adresIstek.projeid.toString()),
                  RequestPageDetailed2(
                      title: 'Adres Tip Adı',
                      value: widget.adresIstek.adrestipadi!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EkipmanCard extends StatefulWidget {
  const EkipmanCard({Key? key, required this.ekipmanIstek}) : super(key: key);
  final Ekipman ekipmanIstek;

  @override
  _EkipmanCardState createState() => _EkipmanCardState();
}

class _EkipmanCardState extends State<EkipmanCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Color(AppColors.secondarycolor),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.ekipmanIstek.makineadi!,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(AppColors.whitetextcolor),
                  fontWeight: FontWeight.bold),
            ),
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RequestPageDetailed2(
                      title: 'Code', value: widget.ekipmanIstek.aciklama!),
                  RequestPageDetailed2(
                      title: 'Kontrol Şekli',
                      value: widget.ekipmanIstek.kontrolsekliadi!),
                  RequestPageDetailed2(
                      title: 'Makine Kodu',
                      value: widget.ekipmanIstek.makinekodu!),
                  RequestPageDetailed2(
                      title: 'Makine Marka',
                      value: widget.ekipmanIstek.makinemarkaadi!),
                  RequestPageDetailed2(
                      title: 'Makine Model',
                      value: widget.ekipmanIstek.makinemodeladi!),
                  RequestPageDetailed2(
                      title: 'Makine Tip',
                      value: widget.ekipmanIstek.makinetipadi!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BakimTanimCard extends StatefulWidget {
  const BakimTanimCard({Key? key, required this.bakimTanimlari})
      : super(key: key);
  final BakimTanimlari bakimTanimlari;

  @override
  _BakimTanimCardState createState() => _BakimTanimCardState();
}

class _BakimTanimCardState extends State<BakimTanimCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Color(AppColors.secondarycolor),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.bakimTanimlari.bakimperiyotadi!,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(AppColors.whitetextcolor),
                  fontWeight: FontWeight.bold),
            ),
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RequestPageDetailed2(
                      title: 'Periyot ID',
                      value: widget.bakimTanimlari.bakimperiyotid.toString()),
                  RequestPageDetailed2(
                      title: 'Katalog ID',
                      value: widget.bakimTanimlari.planlibakimkatalogid
                          .toString()),
                  RequestPageDetailed2(
                      title: 'Kayıt Sıra NO',
                      value: widget.bakimTanimlari.kayitsirano.toString()),
                  RequestPageDetailed2(
                      title: 'Planlı Bakım Tanım ID',
                      value:
                          widget.bakimTanimlari.planlibakimtanimid.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BakimDetayCard extends StatefulWidget {
  const BakimDetayCard({Key? key, required this.bakimDetaylari})
      : super(key: key);
  final BakimDetaylari bakimDetaylari;

  @override
  _BakimDetayCardState createState() => _BakimDetayCardState();
}

class _BakimDetayCardState extends State<BakimDetayCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Color(AppColors.secondarycolor),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ExpansionTile(
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.bakimDetaylari.bakimistanimadi!,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(AppColors.whitetextcolor),
                  fontWeight: FontWeight.bold),
            ),
          ),
          tilePadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RequestPageDetailed2(
                      title: 'Bakım Kodu',
                      value: widget.bakimDetaylari.bakimislemkodu!),
                  RequestPageDetailed2(
                      title: 'Bakım Detay ID',
                      value:
                          widget.bakimDetaylari.planlibakimdetayid.toString()),
                  RequestPageDetailed2(
                      title: 'Bakım İş Tanım ID',
                      value: widget.bakimDetaylari.bakimistanimid.toString()),
                  RequestPageDetailed2(
                      title: 'Bakım Tanım ID',
                      value: widget.bakimDetaylari.bakimistanimid.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SetBakimDetayCard extends StatefulWidget {
  const SetBakimDetayCard({Key? key, required this.bakimDetaylariList})
      : super(key: key);
  final BakimDetaylariList bakimDetaylariList;

  @override
  _SetBakimDetayCardState createState() => _SetBakimDetayCardState();
}

class _SetBakimDetayCardState extends State<SetBakimDetayCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Color(AppColors.secondarycolor),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ExpansionTile(
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.bakimDetaylariList.aciklama!,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(AppColors.whitetextcolor),
                  fontWeight: FontWeight.bold),
            ),
          ),
          tilePadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RequestPageDetailed2(
                      title: 'GUID',
                      value: widget.bakimDetaylariList.guid.toString()),
                  RequestPageDetailed2(
                      title: 'Sonuç',
                      value: widget.bakimDetaylariList.sonuc.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
