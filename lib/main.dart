import 'package:flutter/material.dart';
import 'package:the_way_app/ui/pages/root_screen.dart';

void main() {
  //Aqui injectamos las dependencias.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootScreen(),
    );
  }
}
