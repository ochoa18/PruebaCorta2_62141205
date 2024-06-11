import 'package:flutter_pruebacorta_2/screens/edit_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/agregar_data.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',

      //rutas
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/aggData': (context) => const AggData(),
        '/editData': (context) => const EditData(),
      },
      //rutas
    );
  }
}
