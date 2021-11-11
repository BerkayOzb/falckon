import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  var checkboxValuelogin = false.obs;
  checkboxLoginvalueChange() {
    if (checkboxValuelogin.value) {
      checkboxValuelogin.value = false;
    } else {
      checkboxValuelogin.value = true;
    }
  }

  var checkboxValueEqControl1 = false.obs;
  var checkboxValueEqControl2 = false.obs;
  var checkboxValueEqControl3 = false.obs;
  var checkboxValueEqControl4 = false.obs;
  var checkboxValueEqControl5 = false.obs;
  var checkboxValueEqControl6 = false.obs;
  var checkboxValueEqControl7 = false.obs;
  var checkboxValueEqControl8 = false.obs;

  checkboxValueEq1Change() {
    if (checkboxValueEqControl1.value) {
      checkboxValueEqControl1.value = false;
    } else {
      checkboxValueEqControl1.value = true;
    }
  }

  checkboxValueEq2Change() {
    if (checkboxValueEqControl2.value) {
      checkboxValueEqControl2.value = false;
    } else {
      checkboxValueEqControl2.value = true;
    }
  }

  checkboxValueEq3Change() {
    if (checkboxValueEqControl3.value) {
      checkboxValueEqControl3.value = false;
    } else {
      checkboxValueEqControl3.value = true;
    }
  }

  checkboxValueEq4Change() {
    if (checkboxValueEqControl4.value) {
      checkboxValueEqControl4.value = false;
    } else {
      checkboxValueEqControl4.value = true;
    }
  }

  checkboxValueEq5Change() {
    if (checkboxValueEqControl5.value) {
      checkboxValueEqControl5.value = false;
    } else {
      checkboxValueEqControl5.value = true;
    }
  }

  checkboxValueEq6Change() {
    if (checkboxValueEqControl6.value) {
      checkboxValueEqControl6.value = false;
    } else {
      checkboxValueEqControl6.value = true;
    }
  }

  checkboxValueEq7Change() {
    if (checkboxValueEqControl7.value) {
      checkboxValueEqControl7.value = false;
    } else {
      checkboxValueEqControl7.value = true;
    }
  }

  checkboxValueEq8Change() {
    if (checkboxValueEqControl8.value) {
      checkboxValueEqControl8.value = false;
    } else {
      checkboxValueEqControl8.value = true;
    }
  }
}
