import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  XylophoneNote('note1.wav', Colors.red, width: 440),
                  XylophoneNote('note2.wav', Colors.orange, width: 415),
                  XylophoneNote('note3.wav', Colors.yellow, width: 392),
                  XylophoneNote('note4.wav', Colors.green, width: 370),
                  XylophoneNote('note5.wav', Colors.teal, width: 349),
                  XylophoneNote('note6.wav', Colors.blue, width: 330),
                  XylophoneNote('note7.wav', Colors.purple, width: 311),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class XylophoneNote extends StatelessWidget {
  const XylophoneNote(
    this.asset,
    this.color, {
    required this.width,
    super.key,
  });

  final String asset;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: width,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: color,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            onPressed: () async {
              final player = AudioPlayer();
              await player.play(AssetSource(asset));
            },
            child: Container(),
          ),
        ),
      ),
    );
  }
}
