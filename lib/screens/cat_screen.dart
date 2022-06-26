import 'package:flutter/material.dart';
import 'package:gaas/providers/gato_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<GatoProvider>(context, listen: false).descargarImagenGato;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gato'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Tu foto personalizada',
                style: TextStyle(fontSize: 35),
              ),
              const SizedBox(height: 20),
              const FotoGato(),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Cambiar la foto'),
                onPressed: () {
                  Provider.of<GatoProvider>(context, listen: false)
                      .descargarImagenGato();
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.share),
        onPressed: () async {
          // Compartimos la imagen descargada.
          String ruta = Provider.of<GatoProvider>(context, listen: false).path;

          await Share.shareFiles(
            [ruta],
          );
        },
      ),
    );
  }
}

class FotoGato extends StatelessWidget {
  const FotoGato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Provider.of<GatoProvider>(context).imagenGato,
    );
  }
}
