import 'package:flutter/material.dart';
import 'package:on_screen_ruler/on_screen_ruler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return OnScreenRulerWidget(
          child: widget!,
          activateBgColor: Colors.transparent,
          activateIcon: null,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'On Screen Ruler Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'All Margin should be 16',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('I should have 8 px below me'),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('I should have 16 px below me'),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Sometimes when modify text height then height will be different',
                style: TextStyle(height: 1.2),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Space above me is 16 but on code is 8',
                style: TextStyle(height: 1.5),
              ),
              SizedBox(
                height: 24,
              ),
              Card(
                color: Colors.red,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('This card left and right margin is not 16'),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Card(
                color: Colors.green,
                margin: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('Oh I need too add zero margin on card'),
                ),
              ),
              SizedBox(
                height: 1224,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
