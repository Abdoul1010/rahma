import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:rahma_group/commun/widget/navigation_bar.dart';
import 'package:rahma_group/pages/home.dart';
import 'package:rahma_group/routes/router_generator.dart';
import 'package:rahma_group/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rahma Group',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: accueil,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


