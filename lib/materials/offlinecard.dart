import 'package:falckonfirecommander/materials/cardsDetailed.dart';
import 'package:falckonfirecommander/materials/colors.dart';
import 'package:falckonfirecommander/model/entities/listitem.dart';
import 'package:flutter/material.dart';

class OfflineKayitCard extends StatefulWidget {
  const OfflineKayitCard({Key? key, required this.listitem}) : super(key: key);
  final KayitListesi listitem;

  @override
  _OfflineKayitCardState createState() => _OfflineKayitCardState();
}

class _OfflineKayitCardState extends State<OfflineKayitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(AppColors.secondarycolor),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ExpansionTile(
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.listitem.ustYazi!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(AppColors.whitetextcolor),
              ),
            ),
          ),
          tilePadding: EdgeInsets.symmetric(vertical: 2),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RequestPageDetailed2(
                    title: 'Ofis', value: widget.listitem.ofis!),
                RequestPageDetailed2(
                    title: 'Alet', value: widget.listitem.alet!),
                RequestPageDetailed2(
                    title: 'Tarih', value: widget.listitem.tarih!),
                RequestPageDetailed2(
                    title: 'Durum', value: widget.listitem.durum!),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'SİL',
                      style: TextStyle(color: Color(AppColors.blacktextcolor)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
