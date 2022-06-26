import 'package:flutter/material.dart';
import 'package:gaas/preferences/preferencias.dart';
import 'package:gaas/providers/gato_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controladorTexto =
      TextEditingController(text: Preferencias.texto);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Gatomensajes',
                  style: TextStyle(fontSize: 35),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Escribe una frase y obtén tu foto.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controladorTexto,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Frase para tu foto ...'),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Cargamos la pantalla CatScreen() pasándole el mensaje escrito por el usuario.

                    if (_controladorTexto.text == '') return;

                    Provider.of<GatoProvider>(context, listen: false).texto =
                        _controladorTexto.text;
                    Provider.of<GatoProvider>(context, listen: false)
                        .descargarImagenGato();

                    Navigator.of(context).pushNamed('/cat');
                  },
                  child: const Text('Obtener la foto'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
