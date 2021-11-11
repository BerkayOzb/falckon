import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';

class VisibilityController extends GetxController {
  String activeCompany = '';
  var falseGlobal = false.obs;
  var visibilityValue1 = true.obs;
  var visibilityValue2 = false.obs;
  var visibilityValue3 = false.obs;
  var visibilityValue3W = true.obs;
  var visibilityValue4 = false.obs;
  var visibilityValue4W = false.obs;
  var visibilityValue5 = false.obs;
  var visibilityValue6 = false.obs;
  var visibilityValueBack = false.obs;
  var visibilityValueBackW = false.obs;
  var isActiveExist = false.obs;

  backToFirstSit() {
    visibilityValue1.value = true;
    visibilityValue2.value = false;
    visibilityValue3.value = false;
    visibilityValue3W.value = true;
    visibilityValue4.value = false;
    visibilityValue4W.value = false;
    visibilityValue5.value = false;
    visibilityValue6.value = false;
    visibilityValueBack.value = false;
    visibilityValueBackW.value = false;
  }

  enisActiveExist() {
    isActiveExist.value = true;
  }

  disisActiveExist() {
    isActiveExist.value = false;
  }

  var isDropDownEnable = true.obs;

  String processStatus(bool type, bool isActive) {
    if (isActiveExist.value) {
      if (isActive) {
        if (type) {
          if (visibilityValue1.value) {
            return 'Hiçbir İşlem Başlatılmadı';
          } else if (visibilityValue2.value) {
            return 'Atölyeden Çıkıldı';
          } else if (visibilityValue3.value) {
            return 'Şantiyeye Varıldı';
          } else if (visibilityValue4.value) {
            return 'İşe Başlandı';
          } else if (visibilityValueBack.value) {
            return 'Dönüş Durumu Seçiliyor';
          } else if (visibilityValue5.value) {
            return 'İş Bitirildi';
          } else if (visibilityValue6.value) {
            return 'Dönüş Yoluna Çıkıldı';
          } else {
            return 'İş Tamamlandı';
          }
        } else {
          if (visibilityValue3W.value) {
            return 'Hiçbir İşlem Yapılmadı';
          } else if (visibilityValue4W.value) {
            return 'İşe Başlandı';
          } else {
            return 'İş Bitirildi';
          }
        }
      } else {
        return '$activeCompany\'nın işi bitmeden başka işe başlanamaz.';
      }
    } else {
      if (type) {
        if (visibilityValue1.value) {
          return 'Hiçbir İşlem Başlatılmadı';
        } else if (visibilityValue2.value) {
          return 'Atölyeden Çıkıldı';
        } else if (visibilityValue3.value) {
          return 'Şantiyeye Varıldı';
        } else if (visibilityValue4.value) {
          return 'İşe Başlandı';
        } else if (visibilityValueBack.value) {
          return 'Dönüş Durumu Seçiliyor';
        } else if (visibilityValue5.value) {
          return 'İş Bitirildi';
        } else if (visibilityValue6.value) {
          return 'Dönüş Yoluna Çıkıldı';
        } else {
          return 'İş Tamamlandı';
        }
      } else {
        if (visibilityValue3W.value) {
          return 'Hiçbir İşlem Yapılmadı';
        } else if (visibilityValue4W.value) {
          return 'İşe Başlandı';
        } else {
          return 'İş Bitirildi';
        }
      }
    }
  }

  enableVisBack() {
    visibilityValueBack.value = true;
  }

  enableVisBackW() {
    visibilityValueBackW.value = true;
  }

  disableVisBack() {
    visibilityValueBack.value = false;
  }

  disableVisBackW() {
    visibilityValueBackW.value = false;
  }

  disableDropDown() {
    isDropDownEnable.value = false;
  }

  enableDropDown() {
    isDropDownEnable.value = true;
  }

  enableVis1() {
    visibilityValue1.value = true;
  }

  disableVis1() {
    visibilityValue1.value = false;
  }

  enableVis2() {
    visibilityValue2.value = true;
  }

  disableVis2() {
    visibilityValue2.value = false;
  }

  enableVis3() {
    visibilityValue3.value = true;
  }

  disableVis3() {
    visibilityValue3.value = false;
  }

  enableVis3W() {
    visibilityValue3W.value = true;
  }

  disableVis3W() {
    visibilityValue3W.value = false;
  }

  enableVis4W() {
    visibilityValue4W.value = true;
  }

  disableVis4W() {
    visibilityValue4W.value = false;
  }

  enableVis4() {
    visibilityValue4.value = true;
  }

  disableVis4() {
    visibilityValue4.value = false;
  }

  enableVis5() {
    visibilityValue5.value = true;
  }

  disableVis5() {
    visibilityValue5.value = false;
  }

  enableVis6() {
    visibilityValue6.value = true;
  }

  disableVis6() {
    visibilityValue6.value = false;
  }

  valueChange(String? typeValue) {
    //Unusable
    if (typeValue == 'Gidiş') {
      visibilityValue1.value = true;
      visibilityValue2.value = false;
      visibilityValue3.value = false;
    } else if (typeValue == 'Bakım') {
      visibilityValue2.value = true;
      visibilityValue1.value = false;
      visibilityValue3.value = false;
    } else if (typeValue == 'Geliş') {
      visibilityValue3.value = true;
      visibilityValue1.value = false;
      visibilityValue2.value = false;
    }
  }
}

class DropDownValueController extends GetxController {
  final defaultValue = Rxn<String>();
  valueChange(String? showedValue) {
    defaultValue.value = showedValue!;
  }

  setNull() {
    defaultValue.value = null;
  }
}
