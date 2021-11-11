import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerContraller extends GetxController {
  var tValue = 'KONTROL BAŞLAT (EKİPMAN)'.obs;
  var data = ''.obs;
  scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#000000', "Cancel", true, ScanMode.QR)
        .then((value) => data.value = value);
  }
}
