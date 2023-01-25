import 'package:flutter/material.dart';
import 'design/zuehlke/zuehlke_theme.dart';
import 'main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'juiceflutterpoc',
      //theme: defaultTheme, <-- use this if you don't want to use the Zühlke theme
      theme: zuehlkeTheme,
      home: const MainPage(),
    );
  }
}
