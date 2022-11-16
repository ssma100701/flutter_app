import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SoundPlayer(),
        ),
      ),
    );
  }
}

class SoundPlayer extends StatefulWidget {
  const SoundPlayer({Key? key}) : super(key: key);

  @override
  State<SoundPlayer> createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer> {

  // void playsound(int num) async {
  //   final player = AudioPlayer();
  //   await player.play(AssetSource('note$num.wav'));
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero
          ),
          onPressed: () => {AudioPlayer().play(AssetSource('note1.wav'))},
          child: Container(
            color: Colors.red,
            height: 100,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero
          ),
          onPressed: () => {AudioPlayer().play(AssetSource('note2.wav'))},
          child: Container(
            color: Colors.white60,
            height: 100,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero
          ),
          onPressed: () => {AudioPlayer().play(AssetSource('note3.wav'))},
          child: Container(
            color: Colors.lightBlue,
            height: 100,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero
          ),
          onPressed: () => {AudioPlayer().play(AssetSource('note4.wav'))},
          child: Container(
            color: Colors.orange,
            height: 100,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero
          ),
          onPressed: () => {AudioPlayer().play(AssetSource('note5.wav'))},
          child: Container(
            color: Colors.teal,
            height: 100,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero
          ),
          onPressed: () => {AudioPlayer().play(AssetSource('note6.wav'))},
          child: Container(
            color: Colors.deepPurple,
            height: 100,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero
          ),
          onPressed: () => {AudioPlayer().play(AssetSource('note7.wav'))},
          child: Container(
            color: Colors.amberAccent,
            height: 100,
          ),
        ),
      ],
    );
  }
}
