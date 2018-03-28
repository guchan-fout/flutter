import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

/*
final ThemeData _theme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.black,
  accentColor: Colors.red,
);
*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'Flutter Demo',
      home: new MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('demo_ios/plugin');
  String _returnData = '';

  Future<Null> _getSystemVersion() async {
    String returnData;
    try {
      final String result = await platform.invokeMethod('getSystemVersion');
      returnData = 'SystemVersion：$result';
    } on PlatformException catch (e) {
      returnData = 'error：${e.message}';
    }

    setState((){
      _returnData = returnData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Text('${_returnData}'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _getSystemVersion,
        tooltip: 'getSystemVersion',
        child: new Icon(Icons.autorenew),
      ),
    );
  }
}


