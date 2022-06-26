import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'preferences/preferencias.dart';
import 'providers/gato_provider.dart';
import 'screens/screens.dart';

void main() async {
  // Inicializamos las preferencias.
  WidgetsFlutterBinding.ensureInitialized();
  await Preferencias.iniciar();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GatoProvider(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gatos As A Service',
        theme: ThemeData(primarySwatch: Colors.orange),
        routes: {
          '/': (context) => HomeScreen(),
          '/cat': (context) => const CatScreen(),
        },
      ),
    );
  }
}
