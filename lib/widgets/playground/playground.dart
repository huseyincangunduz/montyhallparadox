import 'dart:math';

import 'package:flutter/material.dart';
import 'package:montyhallparadox/enum/boxType.dart';
import 'package:montyhallparadox/widgets/box/box.dart';
import 'package:collection/collection.dart';
import 'package:montyhallparadox/widgets/informationPage/InformationPage.dart';

class PlaygroundWidget extends StatefulWidget {
  const PlaygroundWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return new PlaygroundWidgetState();
  }
}

class PlaygroundWidgetState extends State<PlaygroundWidget> {
  List<BoxType> boxes = [];
  List<bool> openStates = [false, false, false];
  bool firstOpened = false;
  bool secondOpened = false;
  int carCount = 0;
  int goatCount = 0;
  String msg = "";

  void resetPoints() {
    setState(() {
      this.carCount = 0;
      this.goatCount = 0;
    });
  }

  @override
  void initState() {
    this.resetOpenStatuses();

    super.initState();
  }

  void resetOpenStatuses() {
    setState(() {
      boxes = [BoxType.goat, BoxType.goat, BoxType.goat];
      int carIndex = Random().nextInt(3);
      boxes[carIndex] = BoxType.car;

      firstOpened = false;
      secondOpened = false;
      openStates = [false, false, false];
      this.msg = "Hoş Geldiniz, lütfen bir kutu seçiniz";
    });
  }

  void open(int index) {
    bool boxNotOpenedYet = !this.openStates[index];
    bool suggestionNotMade = !this.firstOpened;
    if (boxNotOpenedYet && suggestionNotMade) {
      setState(() {
        int willBeOpenedOther = 0;
        do {
          willBeOpenedOther = Random().nextInt(3);
        } while (willBeOpenedOther == index ||
            boxes[willBeOpenedOther] == BoxType.car);

        this.openStates[willBeOpenedOther] = true;
        this.firstOpened = true;
        this.msg =
            "Farklı bir kutu seçebilirsiniz ya da aynı kutuda kalabilirsiniz";
      });
    } else if (!this.secondOpened && boxNotOpenedYet) {
      setState(() {
        this.openStates[index] = true;
        if (this.boxes[index] == BoxType.car) {
          carCount++;
          this.msg =
              "Tebrikler, Dacia Logan MVC kazandınız. Lvbel C5 Bluetoothlu paket. Güle güle kullanın";

          // kazandın
        } else {
          goatCount++;
          this.msg = "Kutuda Keçi varmış. Afiyet olsun 👌🍽️";

          // kaybettin
        }
        this.secondOpened = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<BoxWidget> boxWidgets = this.boxes.mapIndexed((index, a) {
      return BoxWidget(
          key: Key(index.toString()),
          type: this.boxes[index],
          onClick: () => this.open(index),
          opened: this.openStates[index]);
    }).toList();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(msg,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: boxWidgets,
          ),
          TextButton(
              onPressed: this.resetOpenStatuses, child: Text("Tekrar dene")),
          Text("Araba: ${carCount}, Keçi: ${goatCount}"),
          TextButton(
              onPressed: this.resetPoints, child: Text("Puanları sıfırla")),
          TextButton(
              onPressed: this.goToInfo,
              child: Text("Monty Hall Problemi nedir?")),
        ],
      ),
    );
  }

  void goToInfo() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (ctx) => new InformationPageWidget()));
  }
}
