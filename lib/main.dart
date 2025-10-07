import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // <<< Dodaj ovaj import
import 'firebase_options.dart'; // <<< Dodaj ovaj import (ovo je generisan fajl)

import 'login_screen.dart';

// main funkcija mora biti 'async' jer Firebase.initializeApp() je asinhrona operacija
void main() async {
  // Ovo osigurava da je Flutter binding inicijalizovan pre nego što se pozove Firebase
  WidgetsFlutterBinding.ensureInitialized(); 

  // Inicijalizuj Firebase
  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform, 
  );

  print('QWER Firebase je uspešno inicijalizovan u Flutter aplikaciji!');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

