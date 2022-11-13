import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const HalloweenApp());
}

class HalloweenApp extends StatelessWidget {
  const HalloweenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spooky',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.orange,
      ),
      home: const MyHomePage(title: 'Halloween App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int counter2 = 10;
  List vals = [
    true,
    false,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    true,
    true,
    true,
    true,
    false
  ];
  List images = [
    'assets/candy.jpg',
    'assets/ghosts.0.0.jpg',
    'assets/hat.jpg',
    'assets/pumpkin-3f3d894.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: (counter2 > 0)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      '$counter2 seconds remaining',
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 600,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildBox(),
                            buildBox(),
                            buildBox(),
                            buildBox(),
                          ],
                        );
                      },
                    ),
                  ),
                  Text(
                    'Counter: $_counter',
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'BOO',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                  Image.asset('assets/hollow.jpg'),
                ],
              ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget buildBox() {
    return GestureDetector(
        onTap: () {
          setState(() {
            _counter++;
          });
        },
        child: Visibility(
            visible: vals[Random().nextInt(16)],
            child: Image.asset(
              images[Random().nextInt(4)],
              height: 150,
              width: 150,
              fit: BoxFit.fitWidth,
            )));
  }

  @override
  void initState() {
    super.initState();
    startcountdown();
  }

  void startcountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter2 > 0) {
        setState(() {
          counter2--;
        });
      } else {
        timer.cancel();
      }
    });
  }
}
