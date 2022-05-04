import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StateLess",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nome = "";
  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        Widget okButton = FlatButton(
          child: Text("OK"),
          onPressed: () { },
        );
        return AlertDialog(
          title: Text('Olá, $nome!'),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Estudando Statefull"),
            centerTitle: true,
          ),
          body: Center(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),

                          labelText: "Nome"),
                      onChanged: (String str) {
                        setState(() {
                          nome = str;
                        });
                      },
                    ),
                    FlatButton(
                      onPressed: _showcontent,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text('OK'),
                    ),
                  ],
                ),
              )),
        ));
  }
}