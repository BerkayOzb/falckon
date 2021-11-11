/// Flutter code sample for DropdownButton

// This sample shows a `DropdownButton` with a large arrow icon,
// purple text style, and bold purple underline, whose value is one of "One",
// "Two", "Free", or "Four".
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:falckonfirecommander/controller/DropDownCheckController.dart';

class FilterCard extends StatefulWidget {
  const FilterCard({Key? key}) : super(key: key);

  @override
  State<FilterCard> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<FilterCard> {
  String dropdownValue = 'İş Emri Numarası';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'İş Emri Numarası',
          'Tarih',
          'Form Tipi',
          'Şase No',
          'Model Adı',
          'Firma',
          'Durumu',
          'Servis'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class RequestPageDropDown extends StatefulWidget {
  final items;
  final String hintValue;
  const RequestPageDropDown(
      {Key? key, required this.items, required this.hintValue})
      : super(key: key);

  @override
  _RequestPageDropDownState createState() => _RequestPageDropDownState();
}

class _RequestPageDropDownState extends State<RequestPageDropDown> {
  final VisibilityController _visibilityController =
      Get.put(VisibilityController());
  final DropDownValueController _dropDownValueController =
      Get.put(DropDownValueController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            disabledHint: Text('İşlem bitmeden Değiştirilemez'),
            hint: Text(widget.hintValue),
            value: _dropDownValueController.defaultValue.value,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: _visibilityController.isDropDownEnable.value
                ? (String? newValue) {
                    _dropDownValueController.valueChange(newValue);
                    _visibilityController.valueChange(newValue);
                  }
                : null,
            items: widget.items,
          ),
        ));
  }
}
