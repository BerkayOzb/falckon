import 'package:falckonfirecommander/model/entities/adres.dart';
import 'package:falckonfirecommander/model/entities/bakim_detaylari.dart';
import 'package:falckonfirecommander/model/entities/bakim_detaylari_list.dart';
import 'package:falckonfirecommander/model/entities/bakim_tanimlari.dart';
import 'package:falckonfirecommander/model/entities/ekipman.dart';
import 'package:falckonfirecommander/model/entities/kullanici.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  String? username;
  String? password;
  List<Ekipman> ekipmanlar = [];
  List<Adres> adresler = [];
  List<BakimTanimlari> bakimTanimlari = [];
  List<BakimDetaylari> bakimDetaylari = [];
  List<BakimDetaylariList> bakimDetaylariList = [];
  //List<Yetkiliprojeler> yetkiliProjeler = [];
  List<Kullanici> kullanicilar = [];
  UserController(this.username, this.password);

  addListEkipman(List<Ekipman> mylist) {
    ekipmanlar = mylist;
  }

  List<Ekipman>? getEkipman() {
    return ekipmanlar;
  }

  addListBakimDetaylariList(List<BakimDetaylariList> mylist) {
    bakimDetaylariList = mylist;
  }

  List<BakimDetaylariList>? getBakimDetaylariList() {
    return bakimDetaylariList;
  }

  // addListYetkiliprojeler(List<Yetkiliprojeler> mylist) {
  //   yetkiliProjeler = mylist;
  // }

  // List<Yetkiliprojeler>? getYetkiliprojeler() {
  //   return yetkiliProjeler;
  // }

  addListKullanici(List<Kullanici> mylist) {
    kullanicilar = mylist;
  }

  List<Kullanici>? getKullanici() {
    return kullanicilar;
  }

  addListBakimTanimlar(List<BakimTanimlari> mylist) {
    bakimTanimlari = mylist;
  }

  List<BakimDetaylari>? getBakimDetaylari() {
    return bakimDetaylari;
  }

  addListBakimDetaylar(List<BakimDetaylari> mylist) {
    bakimDetaylari = mylist;
  }

  List<BakimTanimlari>? getBakimTanimlari() {
    return bakimTanimlari;
  }

  addListAdresler(List<Adres> mylist) {
    adresler = mylist;
  }

  List<Adres>? getAdresler() {
    return adresler;
  }
}
