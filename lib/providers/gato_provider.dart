import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../preferences/preferencias.dart';

class GatoProvider extends ChangeNotifier {
  late Image _imagenGato;
  late String _texto;
  late String _path;

  GatoProvider() {
    _texto = Preferencias.texto;

    _imagenGato = Image.asset('assets/gato_placeholder.png');

    Future<Directory> temp = getTemporaryDirectory();

    temp.then((value) {
      _path = '${value.path}/image${Random().nextInt(200)}.jpg';
    });
  }

  descargarImagenGato() async {
    // He decidido no usar Image.network() para descargar la foto ya que necesito tenerla guardada en el dispositivo
    // para compartirla después.

    // Descargar la imagen del gato con el mensaje, y guardarla en una carpeta temporal en el dispositivo.
    final urlImagen = 'https://cataas.com/cat/says/$_texto';

    final url = Uri.parse(urlImagen);
    final response = await http.get(url, headers: {
      'Cache-Control': 'no-cache',
    });
    final bytes = response.bodyBytes;

    final temp = await getTemporaryDirectory();

    // Guardamos la imagen cada vez con un nombre distinto. De no hacer esto, la imagen de la pantalla no se modifica. Parece un problema con la caché de File(path), pero las pruebas que he hecho con la instrucción "imageCache.clear()" no han sido satisfactorias.
    _path = '${temp.path}/image${Random().nextInt(200)}.jpg';

    File(_path).writeAsBytesSync(bytes);

    _imagenGato = Image.file(File(_path));

    // Notificamos que hay una imagen descargada.
    notifyListeners();
  }

  get imagenGato => _imagenGato;

  set texto(String texto) {
    _texto = texto;

    Preferencias.texto = texto;
  }

  String get texto => _texto;

  get path => _path;
}
