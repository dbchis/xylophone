import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(
      MaterialApp(
        home: Xylophone(),
      ),
    );

class Xylophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Xylophone_dbchis'),
      ),
      body: Xylo(),
    );
  }
}

class Xylo extends StatefulWidget {
  @override
  _XyloState createState() => _XyloState();
}

class _XyloState extends State<Xylo> {
  // @override
  // Widget build(BuildContext context) {
  //   var a = generateWordPairs().first;
  //   return Center(
  //     child: Text(
  //       a.asPascalCase,
  //     ),
  //   );
  // }
  void playSound(int a) {
    final player = AudioPlayer();
    try {
      player.setAsset('assets/note$a.wav');
      player.play();
      print("Playing sound: $a");
    } catch (e) {
      print("Error playing audio: $e");
    }
  }
  Expanded buildKey({Color? color, required int a}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color ?? Colors.yellow,
        ),
        onPressed: () async {
          playSound(a);
        },
        child: Text('$a'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var a = generateWordPairs().first;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, a: 1),
          buildKey(color: Colors.yellow, a: 2),
          buildKey(color: Colors.green, a: 3),
          buildKey(color: Colors.blue, a: 4),
          buildKey(color: Colors.black, a: 5),
          buildKey(color: Colors.orange, a: 6),
          buildKey(color: Colors.grey, a: 7),

      ],
      ),
    );
  }
}
