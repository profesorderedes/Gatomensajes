import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  static late SharedPreferences _prefs;
  static String _texto = 'mensaje';

  // Este método es necesario que devuelva un Future para poder ejecutarlo de forma asíncrona en el main().
  static Future iniciar() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get texto {
    return _prefs.getString('texto') ?? _texto;
  }

  static set texto(String texto) {
    _texto = texto;
    _prefs.setString('texto', texto);
  }
}
