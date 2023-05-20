import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'How\'s my today\'s day',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.grey[800],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: const <Widget>[
              Expanded(
                child: Wheel(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Wheel extends StatefulWidget {
  const Wheel({super.key});

  @override
  State<Wheel> createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  @override
  Widget build(BuildContext context) {
    StreamController<int> selected = StreamController<int>();

    // array of fortune wheel item's
    // we have to map this array later
    final items = <String>[
      'Good Day',
      'Bad Day',
      'Ok Ok',
      'Confused',
      'Can\'t Say',
    ];

    void spinWheel() {
      setState(() {
        selected.add(
          Fortune.randomInt(0, items.length),
        );
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 350,
          child: FortuneWheel(
            // changing the return animation when the user stops dragging
            selected: selected.stream,
            indicators: const <FortuneIndicator>[
              FortuneIndicator(
                alignment: Alignment.topCenter,
                child: TriangleIndicator(
                  color: Colors.yellow,
                ),
              ),
            ],
            items: [
              FortuneItem(
                child: Text(
                  items[0], // array item at position 1
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: const FortuneItemStyle(color: Colors.green),
              ),
              FortuneItem(
                child: Text(
                  items[1], // array item at position 2
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: const FortuneItemStyle(color: Colors.red),
              ),
              FortuneItem(
                child: Text(
                  items[2], // array item at position 3
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: const FortuneItemStyle(color: Colors.teal),
              ),
              FortuneItem(
                child: Text(
                  items[3], // array item at position 4
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: const FortuneItemStyle(color: Colors.orange),
              ),
              FortuneItem(
                child: Text(
                  items[4], // last array item at position 5
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: const FortuneItemStyle(color: Colors.deepOrangeAccent),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton(
          onPressed: spinWheel,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          child: const Text(
            'Turn Wheel',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
