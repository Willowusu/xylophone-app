import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  int note;
  Future<void> playsound(note) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$note.wav'));
  }

  Expanded buildKey({Color buttonColor, int noteNumber}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playsound(noteNumber);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor)),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black, title: Text("Xylophone App"),),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(buttonColor: Colors.red, noteNumber: 1),
              buildKey(buttonColor: Colors.orange, noteNumber: 2),
              buildKey(buttonColor: Colors.yellow, noteNumber: 3),
              buildKey(buttonColor: Colors.green, noteNumber: 4),
              buildKey(buttonColor: Colors.blue, noteNumber: 5),
              buildKey(buttonColor: Colors.indigo, noteNumber: 6),
              buildKey(buttonColor: Colors.purple, noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
