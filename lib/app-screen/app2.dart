import 'package:flutter/material.dart';

class MyAnotherState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Flup();
  }
}

class _Flup extends State<MyAnotherState> {
  int _count = 0;

  void _add() {
    setState(() {
      _count++;
    });
  }

  void _minus() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(" Simple Interest Calculater"),
            ),
            body: Center(
                child: Container(
                    margin: EdgeInsets.all(25.0),
                    child: Column(children: <Widget>[
                      /*Text('count equal to $_count'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _add,
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: _minus,
                      )*/
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: " Enter your email ",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: " Enter Strong Password ",
                        ),
                        keyboardType: TextInputType.text,
                          
                      )
                    ])))));
  }
}
