import 'package:flutter/material.dart';
import 'package:montyhallparadox/widgets/box/box.dart';
import 'package:montyhallparadox/widgets/playground/playground.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar.new(
          title: Text("Monty Hall Paradoksu"),
        ),
        body: Center(
          child: PlaygroundWidget(),
        ),
      ),
    );
  }
}
