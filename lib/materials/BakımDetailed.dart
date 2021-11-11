import 'package:flutter/material.dart';
import 'package:falckonfirecommander/materials/colors.dart';

class BakimDet extends StatelessWidget {
  const BakimDet(
      {Key? key,
      required this.textValue,
      required this.method,
      required this.icon,
      required this.widthh})
      : super(key: key);
  final String textValue;
  final method;
  final Icon icon;
  final widthh;

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      //width: Get.width / 2.3,
      width: widthh,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(width: 0))),
          backgroundColor:
              MaterialStateProperty.all<Color>(Color(AppColors.whitetextcolor)),
        ),
        onPressed: method,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: icon,
              padding: EdgeInsets.all(3),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                textValue,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(AppColors.blacktextcolor),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
