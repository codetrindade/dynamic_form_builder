
import 'package:dynamic_form_builder/dynamic_form/src/views/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Form Builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 58, 58)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Dynamic Form Builder'),
    );
  }
}
