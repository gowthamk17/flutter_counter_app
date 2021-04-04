import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Flutter App',
      home: Counting(),
    );
  }
}

class Counting extends StatefulWidget {
  @override
  _CountingState createState() => _CountingState();
}

class _CountingState extends State<Counting> {
  int count = 0;

  List<Color> _color = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.deepOrangeAccent
  ];

  increment() {
    setState(() {
      count++;
    });
  }

  decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
  }

  refresh() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color[count % _color.length],
      appBar: AppBar(
        title: Text('Flutter App'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black26,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Number of times you tapped the button',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$count',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: refresh,
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: decrement,
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: increment,
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
