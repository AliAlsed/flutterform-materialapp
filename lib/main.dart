import 'package:flutter/material.dart';
import 'package:materialapp/app-screen/app2.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigo,
        backgroundColor: Colors.cyanAccent,
      ),
      home: _SIForm(),
    );
  }
}

class _SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<_SIForm> {
  var currency = ['Ruppies', 'Dolllars', 'Pounds'];
  final minPadding = 5.0;
  var currentCurrency = 'Ruppies';
  var displayResult = "";
  var formKey = GlobalKey<FormState>();
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(" Simple Interest Calculater"),
        ),
        body: Form(
            key: formKey,
            child: Padding(
                padding: EdgeInsets.all(minPadding * 2.0),
                child: ListView(
                  children: <Widget>[
                    getImageAsset(),
                    Container(width: minPadding * 5.0),
                    Padding(
                        padding: EdgeInsets.only(
                            top: minPadding, bottom: minPadding),
                        child: TextFormField(
                          style: style,
                          controller: principalController,
                          validator: (String v) {
                            if (v.trim().isEmpty) {
                              return ' please Enter principal Amount';
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'principal',
                              labelStyle: style,
                              errorStyle: TextStyle(
                                  color: Colors.yellowAccent, fontSize: 15.0),
                              hintText: 'Enter principal e.g. 1200',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                    Container(width: minPadding * 5.0),
                    Container(width: minPadding * 5.0),
                    Container(width: minPadding * 5.0),
                    Padding(
                        padding: EdgeInsets.only(
                            top: minPadding, bottom: minPadding),
                        child: TextFormField(
                          style: style,
                          controller: roiController,
                          keyboardType: TextInputType.number,
                          validator: (String v) {
                            if (v.trim().isEmpty) {
                              return ' please Enter Rate Amount';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Rate of Interest',
                              labelStyle: style,
                              hintText: 'In Percent',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                    Container(width: minPadding * 5.0),
                    Padding(
                        padding: EdgeInsets.only(
                            top: minPadding, bottom: minPadding),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: TextFormField(
                              style: style,
                              controller: termController,
                              validator: (String v) {
                                if (v.trim().isEmpty) {
                                  return 'please Enter Term Amount';
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Term',
                                  labelStyle: style,
                                  hintText: 'Time in Years',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            )),
                            Container(width: minPadding * 5.0),
                            Expanded(
                                child: DropdownButton<String>(
                              items: currency.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: currentCurrency,
                              onChanged: (String newVal) {
                                setState(() {
                                  currentCurrency = newVal;
                                });
                              },
                            ))
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: minPadding, bottom: minPadding),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: RaisedButton(
                              color: Theme.of(context).accentColor,
                              textColor: Theme.of(context).primaryColorDark,
                              child: Text(
                                "Calculater",
                                textScaleFactor: 1.5,
                              ),
                              //color: Colors.purpleAccent,
                              onPressed: () {
                                setState(() {
                                  if (formKey.currentState.validate()) {
                                    this.displayResult = calcReturn();
                                  }
                                });
                              },
                            )),
                            Expanded(
                                child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text(
                                "Reset",
                                textScaleFactor: 1.5,
                              ),
                              //color: Colors.purple,
                              onPressed: () {
                                setState(() {
                                  this.principalController.text = '';
                                  this.roiController.text = '';
                                  this.termController.text = '';
                                  this.displayResult = '';
                                  this.currentCurrency = this.currency[0];
                                });
                              },
                            ))
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.all(minPadding * 2),
                      child: Text(
                        this.displayResult,
                      ),
                    )
                  ],
                ))));
  }

  Widget getImageAsset() {
    AssetImage image = AssetImage("images/money.png");
    Image img = Image(
      image: image,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      alignment: Alignment.center,
      child: img,
      margin: EdgeInsets.all(minPadding * 10),
    );
  }

  String calcReturn() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double total = (principal * roi * term) / 100;
    return " after $term , your investment will be worth $total";
  }
}
