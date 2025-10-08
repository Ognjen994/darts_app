import 'package:darts_app/app/config/router/app_router.dart';
import 'package:flutter/material.dart';

class DartsApp extends StatelessWidget {
  const DartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Darts App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router, 
    );
  }
}