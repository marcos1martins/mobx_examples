import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_reactions/controller.dart';

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
  final controller = Controller();
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    disposers = [
      reaction<bool>((r) => controller.counter % 2 != 0, (isOdd) {
        if (isOdd) {
          Flushbar(
            title: 'Counter',
            message: 'É ímpar!',
            duration: Duration(milliseconds: 900),
          ).show(context);
        }
      }),

      //executa somente uma vez
      when(
          (r) => controller.counter >= 10,
          () => Flushbar(
                title: 'Counter',
                message: 'É 10!',
                duration: Duration(milliseconds: 900),
              ).show(context)),

      autorun((_) => print(controller.counter)),

      autorun((_) => print('counter é par? ${controller.isEven}')),
    ];
    super.initState();
  }

  @override
  void dispose() {
    disposers.forEach((dispose) => dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
