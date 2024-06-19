import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class InformationPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InformationPageWidgetState();
  }
}

class InformationPageWidgetState extends State<InformationPageWidget> {
  String html = "";
  bool init = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString('assets/info/montyhall/index.html')
        .then((a) {
      this.setState(() {
        this.html = a;
        this.init = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Monty Hall paradoksu nedir?"),
      ),
      body: init
          ? new SingleChildScrollView(
              child:
                  Padding(padding: EdgeInsets.all(10), child: HtmlWidget(html)),
            )
          : Text("Lütfen bekleyin"),
    );
  }
}
