// ignore_for_file: non_constant_identifier_names

import 'package:falckonfirecommander/model/entities/adres.dart';
import 'package:falckonfirecommander/model/entities/bakim_detaylari.dart';
import 'package:falckonfirecommander/model/entities/bakim_detaylari_list.dart';
import 'package:falckonfirecommander/model/entities/bakim_tanimlari.dart';
import 'package:falckonfirecommander/model/entities/ekipman.dart';
import 'package:falckonfirecommander/model/entities/kullanici.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await initDB();

    return _database!;
  }

  // ADRES TABLOSU
  static const String DB_NAME = 'adres.db';
  static const String ADRES_TABLOSU = 'adresTablo';
  static const String ADRES = 'adres';
  static const String ADRES_KODU = 'adreskodu';
  static const String ADRES_TIP_ADI = 'adrestipadi';
  static String ADRES_TIP_ID = 'adrestipid'.toString();
  static String FIRMA_ADRES_ID = 'firmaadresid'.toString();
  static String FIRMA_TANIM_ID = 'firmatanimid'.toString();
  static String PROJE_TANIM_ID = 'projeid'.toString();
  // BAKIM DETAYLARI TABLOSU
  static const String BAKIM_DETAYLARI_TABLOSU = 'bakimDetaylariTablo';
  static const String BAKIM_ISLEM_KODU = 'BAKIMISLEMKODU';
  static const String BAKIM_IS_TANIM_ADI = 'BAKIMISTANIMADI';
  static String BAKIM_IS_TANIM_ID = 'BAKIMISTANIMID'.toString();
  static String PLANLI_BAKIM_TANIM_ID = 'PLANLIBAKIMTANIMID'.toString();
  static String PLANLI_BAKIM_DETAY_ID = 'PLANLIBAKIMDETAYID'.toString();
  // BAKIM DETAYLARI LIST TABLOSU
  static const String BAKIM_DETAYLARI_LIST_TABLOSU = 'bakimDetaylariListTablo';
  static const String ACIKLAMA_DETAY = 'ACIKLAMA';
  static const String GUID = 'GUID';
  static const dynamic SONUC = 'SONUC';
  // Bakım Tanımları Tablosu
  static const String BAKIM_TANIMLARI_TABLOSU = 'bakimTanimlariTablo';
  static const String BAKIM_PERIYOT_ADI = 'BAKIMPERIYOTADI';
  static const String BAKIM_PERIYOT_ID = 'BAKIMPERIYOTID';
  static const String KAYIT_SIRA_NO = 'KAYITSIRANO';
  static const String PLANLI_BAKIM_KATALOG_ID = 'PLANLIBAKIMKATALOGID';
  static const String PLANLI_BAKIM_TANIM_ID2 = 'PLANLIBAKIMTANIMID';
  // Ekipman Tablosu
  static const String EKIPMAN_TABLOSU = 'ekipmanTablo';
  static const String ACIKLAMA = 'ACIKLAMA';
  static const String KONTROL_SEKLI_ADI = 'KONTROLSEKLIADI';
  static const String MAKINE_ADI = 'MAKINEADI';
  static const String MAKINE_KODU = 'MAKINEKODU';
  static const String MAKINE_MARKA_ADI = 'MAKINEMARKAADI';
  static const String MAKINE_MODEL_ADI = 'MAKINEMODELADI';
  static const String MAKINE_TIP_ADI = 'MAKINETIPADI';
  //Kullanıcı Tablosu
  static const String KULLANICI_TABLOSU = 'kullaniciTabloo';
  static const dynamic IDARI_IS_YETKILI = 'IDARIISLERYETKILI';
  static const dynamic IK_YETKILI = 'IKYETKILI';
  static const String KULLANICI_ADI_SOYADI = 'KULLANICIADISOYADI';
  static const String KULLANICI_ID = 'KULLANICIID';
  static const String LOGIN_KODU = 'LOGINKODU';
  static const String PERSONEL_ID = 'PERSONELID';
  static const String YETKILI_PROJELER = 'YETKILIPROJELER';

  initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, '$DB_NAME');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $ADRES_TABLOSU('
          '$ADRES TEXT,'
          '$ADRES_KODU TEXT,'
          '$ADRES_TIP_ADI TEXT,'
          '$ADRES_TIP_ID INTEGER,'
          '$FIRMA_ADRES_ID INTEGER,'
          '$FIRMA_TANIM_ID INTEGER,'
          '$PROJE_TANIM_ID INTEGER'
          ')');
      await db.execute('CREATE TABLE $BAKIM_DETAYLARI_TABLOSU('
          '$BAKIM_ISLEM_KODU TEXT,'
          '$BAKIM_IS_TANIM_ADI TEXT,'
          '$BAKIM_IS_TANIM_ID INTEGER,'
          '$PLANLI_BAKIM_DETAY_ID INTEGER,'
          '$PLANLI_BAKIM_TANIM_ID INTEGER'
          ')');
      await db.execute('CREATE TABLE $BAKIM_DETAYLARI_LIST_TABLOSU('
          '$ACIKLAMA TEXT,'
          '$GUID INTEGER,'
          '$SONUC INTEGER'
          ')');

      await db.execute('CREATE TABLE $BAKIM_TANIMLARI_TABLOSU('
          '$BAKIM_PERIYOT_ADI TEXT,'
          '$BAKIM_PERIYOT_ID INTEGER,'
          '$KAYIT_SIRA_NO INTEGER,'
          '$PLANLI_BAKIM_KATALOG_ID INTEGER,'
          '$PLANLI_BAKIM_TANIM_ID2 INTEGER'
          ')');
      await db.execute('CREATE TABLE $EKIPMAN_TABLOSU('
          '$ACIKLAMA TEXT,'
          '$KONTROL_SEKLI_ADI TEXT,'
          '$MAKINE_ADI TEXT,'
          '$MAKINE_KODU TEXT,'
          '$MAKINE_MARKA_ADI TEXT,'
          '$MAKINE_MODEL_ADI TEXT,'
          '$MAKINE_TIP_ADI TEXT'
          ')');
      await db.execute('CREATE TABLE $KULLANICI_TABLOSU('
          '$IDARI_IS_YETKILI INTEGER'
          '$IK_YETKILI INTEGER'
          '$KULLANICI_ADI_SOYADI TEXT,'
          '$KULLANICI_ID INTEGER,'
          '$LOGIN_KODU TEXT,'
          '$PERSONEL_ID INTEGER,'
          '$YETKILI_PROJELER TEXT'
          ')');
    });
  }

  createKullaniciList(Kullanici kullanici) async {
    final db = await database;
    final result = await db.insert('$KULLANICI_TABLOSU', kullanici.toMap());
    return result;
  }

  // Delete all
  Future<int> deleteAllKullanici() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM kullaniciTablo');

    return res;
  }

  Future<List<Kullanici>> getAllKullanici() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM kullaniciTablo");

    List<Kullanici> list =
        res.isNotEmpty ? res.map((c) => Kullanici.fromMap(c)).toList() : [];

    return list;
  }

  createEkipmanList(Ekipman ekipman) async {
    final db = await database;
    final result = await db.insert('$EKIPMAN_TABLOSU', ekipman.toMap());
    return result;
  }

  // Delete all
  Future<int> deleteAllEkipman() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM ekipmanTablo');

    return res;
  }

  Future<List<Ekipman>> getAllEkipman() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM ekipmanTablo");

    List<Ekipman> list =
        res.isNotEmpty ? res.map((c) => Ekipman.fromMap(c)).toList() : [];

    return list;
  }

  createBakimTanimList(BakimTanimlari bakimTanimlari) async {
    final db = await database;
    final result =
        await db.insert('$BAKIM_TANIMLARI_TABLOSU', bakimTanimlari.toMap());
    return result;
  }

  // Delete all
  Future<int> deleteAllBakimTanimlari() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM bakimTanimlariTablo');

    return res;
  }

  Future<List<BakimTanimlari>> getAllBakimTanimlari() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM bakimTanimlariTablo");

    List<BakimTanimlari> list = res.isNotEmpty
        ? res.map((c) => BakimTanimlari.fromMap(c)).toList()
        : [];

    return list;
  }

  createBakimDetayList(BakimDetaylari bakimDetaylari) async {
    final db = await database;
    final result =
        await db.insert('$BAKIM_DETAYLARI_TABLOSU', bakimDetaylari.toMap());
    return result;
  }

  // Delete all
  Future<int> deleteAllBakimDetaylari() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM bakimDetaylariTablo');

    return res;
  }

  Future<List<BakimDetaylari>> getAllBakimDetaylari() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM bakimDetaylariTablo");

    List<BakimDetaylari> list = res.isNotEmpty
        ? res.map((c) => BakimDetaylari.fromMap(c)).toList()
        : [];

    return list;
  }

  createBakimDetaylariList(BakimDetaylariList bakimDetaylariList) async {
    final db = await database;
    final result = await db.insert(
        '$BAKIM_DETAYLARI_LIST_TABLOSU', bakimDetaylariList.toMap());
    return result;
  }

  // Delete all
  Future<int> deleteAllBakimDetaylariList() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM bakimDetaylariListTablo');

    return res;
  }

  Future<List<BakimDetaylariList>> getAllBakimDetaylariList() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM bakimDetaylariListTablo");

    List<BakimDetaylariList> list = res.isNotEmpty
        ? res.map((c) => BakimDetaylariList.fromMap(c)).toList()
        : [];

    return list;
  }

  createAdresList(Adres adresler) async {
    final db = await database;
    final result = await db.insert('$ADRES_TABLOSU', adresler.toMap());

    return result;
  }

  // Delete all
  Future<int> deleteAllAdres() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM adresTablo');

    return res;
  }

  Future<List<Adres>> getAllAdres() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM adresTablo");

    List<Adres> list =
        res.isNotEmpty ? res.map((c) => Adres.fromMap(c)).toList() : [];

    return list;
  }

  Future close() async {
    final _db = await db.database;
    _db.close();
  }
}
