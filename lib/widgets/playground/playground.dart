import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:montyhallparadox/enum/boxType.dart';

class PlaygroundWidget extends StatefulWidget {
  const PlaygroundWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return new PlaygroundWidgetState();
  }
}

class PlaygroundWidgetState extends State<PlaygroundWidget> {
  BoxType[] boxes = [];
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
