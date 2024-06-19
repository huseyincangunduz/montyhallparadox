import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:montyhallparadox/enum/boxType.dart';

class BoxWidget extends StatefulWidget {
  // const Box();
  const BoxWidget({super.key});

  @override
  State<BoxWidget> createState() {
    return new BoxWidgetState();
  }
}

class BoxWidgetState extends State<BoxWidget> {
  bool opened = false;
  BoxType type = BoxType.goat;
  @override
  build(BuildContext context) {
    // google yapacağın programlama dilini sikeyim
    var btn = TextButton(
      onPressed: () {
        if (this.opened) {
          this.reset();
        } else {
          openTheBox();
        }
      },
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.green[400]),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(TextStyle(fontSize: 72.0))),
      child: Text(
        this.opened ? (this.type == BoxType.car ? "🚗" : "🐐") : "?",
      ),
    );

    return btn;
  }

  reset() {
    this.setState(() {
      this.type = Random().nextBool() ? BoxType.car : BoxType.goat;

      opened = false;
    });
  }

  openTheBox() {
    this.setState(() {
      opened = true;
    });
  }
}

// class Bird extends StatefulWidget {
//   const Bird({
//     super.key,
//     this.color = const Color(0xFFFFE306),
//     this.child,
//   });

//   final Color color;
//   final Widget? child;

//   @override
//   State<Bird> createState() => _BirdState();
// }

// class _BirdState extends State<Bird> {
//   double _size = 1.0;

//   void grow() {
//     setState(() { _size += 0.1; });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: widget.color,
//       transform: Matrix4.diagonal3Values(_size, _size, 1.0),
//       child: widget.child,
//     );
//   }
// }