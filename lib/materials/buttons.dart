// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:falckonfirecommander/materials/colors.dart';

class ClassicButton extends StatelessWidget {
  const ClassicButton({Key? key, required this.textValue, required this.method})
      : super(key: key);
  final String textValue;
  final method;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(
                    color: Color(AppColors.blacktextcolor), width: 3))),
        backgroundColor:
            MaterialStateProperty.all<Color>(Color(AppColors.themecolor)),
      ),
      onPressed: method,
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              textValue,
              style: TextStyle(
                  color: Color(AppColors.blacktextcolor),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  const HomePageButton(
      {Key? key,
      required this.textValue,
      required this.method,
      required this.icon})
      : super(key: key);
  final String textValue;
  final method;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(AppColors.secondarycolor),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(AppColors.blacktextcolor))),
      child: ListTile(
        onTap: method,
        leading: icon,
        title: Text(
          textValue,
          style: TextStyle(
              color: Color(AppColors.whitetextcolor),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class GoruntuleButton extends StatelessWidget {
  const GoruntuleButton({
    Key? key,
    required this.textValue,
    required this.method,
  }) : super(key: key);
  final String textValue;
  final method;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(AppColors.secondarycolor),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(AppColors.blacktextcolor))),
      child: ListTile(
        onTap: method,
        title: Text(
          textValue,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(AppColors.whitetextcolor),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DetPage extends StatelessWidget {
  const DetPage(
      {Key? key,
      required this.widthh,
      required this.textValue,
      required this.method,
      required this.icon})
      : super(key: key);
  final String textValue;
  final method;
  final Icon icon;
  final double widthh;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthh,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(AppColors.whitetextcolor),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(AppColors.blacktextcolor))),
      child: ListTile(
        onTap: method,
        leading: icon,
        title: Text(
          textValue,
          style: TextStyle(
              color: Color(AppColors.blacktextcolor),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class OfflineButton extends StatelessWidget {
  const OfflineButton(
      {Key? key,
      required this.textValue,
      required this.method,
      required this.renk})
      : super(key: key);
  final String textValue;
  final method;
  final Color renk;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      width: Get.width / 1.2,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(AppColors.blacktextcolor))),
      child: ElevatedButton(
        onPressed: method,
        child: Text(
          textValue,
          style: TextStyle(
              color: Color(AppColors.whitetextcolor),
              fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(renk),
        ),
      ),
    );
  }
}
