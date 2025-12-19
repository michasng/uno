import 'package:flutter/material.dart';
import 'package:uno/pages/play/play_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'UNO', home: PlayPage());
  }
}
