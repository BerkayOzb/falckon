import 'package:falckonfirecommander/materials/DropDownButtons.dart';
import 'package:flutter/material.dart';
import 'package:falckonfirecommander/materials/colors.dart';

class LabelTextDet extends StatelessWidget {
  final String? title;
  final String? value;
  const LabelTextDet({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: InputDecorator(
            child: Text(value!),
            decoration: InputDecoration(
                labelStyle: TextStyle(
                    fontSize: 25, color: Color(AppColors.secondarycolor)),
                labelText: title,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(AppColors.secondarycolor)),
                    borderRadius: BorderRadius.circular(10)))));
  }
}

class RequestPageDetailed2 extends StatelessWidget {
  final String title;
  final String value;
  const RequestPageDetailed2(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(AppColors.whitetextcolor), fontSize: 15),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(AppColors.whitetextcolor),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(8),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

class RequestPageDropdownDet extends StatelessWidget {
  final String title;
  final items;
  final String hintValue;

  const RequestPageDropdownDet({
    Key? key,
    required this.title,
    required this.items,
    required this.hintValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(AppColors.whitetextcolor), fontSize: 15),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(AppColors.whitetextcolor),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: RequestPageDropDown(
              hintValue: hintValue,
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}
