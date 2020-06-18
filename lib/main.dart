import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedValue = 'init';
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        autovalidate: _autoValidate,
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButtonFormField<String>(
              validator: (x) => x == null ? 'Required' : null,
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(child: Text('aaa'), value: 'aaa'),
                DropdownMenuItem<String>(child: Text('bbb'), value: 'bbb'),
                DropdownMenuItem<String>(child: Text('ccc'), value: 'ccc'),
              ],
              onChanged: (String value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            Text(_selectedValue),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                } else {
                  setState(() {
                    _autoValidate = true;
                  });
                }
              },
              child: Text('SUBMIT'),
            )
          ],
        ),
      ),
    );
  }
}
