import '../../data/sources/local/sharedpreferences.dart';

class Utiles {
  static String token = "";

  static removeToken() {
    token = "";
    CacheHelper.removeData(key: "token");
  }
}
