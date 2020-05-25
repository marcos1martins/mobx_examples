import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx3/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MobX',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Formulário'),
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
  final Controller controller = Controller();

  _textField({String label, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) {
                return _textField(
                  label: 'nome',
                  onChanged: controller.client.changeName,
                  errorText: controller.validateName,
                );
              },
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) {
                return _textField(
                  label: 'email',
                  onChanged: controller.client.changeEmail,
                  errorText: controller.validateEmail,
                );
              },
            ),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return RaisedButton(
                disabledColor: Colors.grey,
                color: Colors.amber,
                onPressed: controller.isValid ? () {} : null,
                child: Text('Salvar'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
