import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': {
          'compname': 'FALCKON',
          'maintmenagement': 'BAKIM YÖNETİMİ',
          'user': 'Kullanıcı',
          'password': 'Parola',
          'remember_me': 'Beni Hatırla',
          'sign_in': 'Giriş Yap',
        },
        'en_US': {
          'compname': 'FALCKON',
          'maintmenagement': 'MEINTENANCE MENAGEMENT',
          'user': 'User',
          'password': 'Password',
          'remember_me': 'Remember Me',
          'sign_in': 'Sign In',
        }
      };
}
