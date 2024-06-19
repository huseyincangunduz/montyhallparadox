import 'package:flutter/material.dart';
import 'package:montyhallparadox/enum/boxType.dart';

class BoxWidget extends StatelessWidget {
  // const Box();
  BoxType type;
  void Function() onClick;
  bool opened;

  BoxWidget(
      {super.key,
      required this.type,
      required this.onClick,
      required this.opened});

  @override
  Widget build(BuildContext context) {
    Image img = this.opened
        ? (this.type == BoxType.car
            ? Image.asset(
                "assets/img/car.jpg",
                height: 75,
                width: 75,
              )
            : Image.asset("assets/img/goat.png", height: 75, width: 75))
        : Image.asset("assets/img/surprise.png", height: 75, width: 75);
    return GestureDetector(
        onTap: () {
          this.onClick();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.all(5.0),
          child: img,
        ));

    // var btn = TextButton(
    //   onPressed: () {
    //     this.onClick();
    //   },
    //   style: ButtonStyle(
    //       backgroundColor: WidgetStateProperty.all(Colors.green[400]),
    //       foregroundColor: WidgetStateProperty.all(Colors.white),
    //       textStyle: WidgetStateProperty.all(TextStyle(fontSize: 72.0))),
    //   child: Text(
    //,
    //   ),
    // );

    // return btn;
  }
  // @override
  // State<BoxWidget> createState() {
  //   return new BoxWidgetState(type: type);
  // }
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
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: widget.color,
  //     transform: Matrix4.diagonal3Values(_size, _size, 1.0),
  //     child: widget.child,
  //   );
  // }
// }