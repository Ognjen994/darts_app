import 'package:darts_app/app/app.dart';
import 'package:darts_app/app/config/di/app_injector.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // <<< Dodaj ovaj import
import 'core/services/firebase_options.dart'; // <<< Dodaj ovaj import (ovo je generisan fajl)


// main funkcija mora biti 'async' jer Firebase.initializeApp() je asinhrona operacija
void main() async {
  // Ovo osigurava da je Flutter binding inicijalizovan pre nego što se pozove Firebase
  WidgetsFlutterBinding.ensureInitialized(); 

  // Inicijalizuj Firebase
  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform, 
  );
await AppInjector.setup();
  runApp(const DartsApp());
}



