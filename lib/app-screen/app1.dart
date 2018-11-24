import 'package:flutter/material.dart';

class MyState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Flup();
  }
}

class Flup extends State<MyState> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Card(
            child: Column(children: <Widget>[
          Image.asset('images/money.png'),
          Text(' more money'),
          Text(' again more money ricccccch'),
        ])),
        Card(
          child: Column(
            children: <Widget>[
              Image.asset('images/png.png'),
              Text(' more Apple'),
              Text(' stive jops')
            ],
          ),
        )
      ],
    );
  }
}
