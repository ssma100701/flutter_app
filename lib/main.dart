import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  void playSound(int num) {
    final player = AudioPlayer();
    player.play(AssetSource('note$num.wav'));
  }

  List<Expanded> renderKey() {
    var eps = <Expanded>[];
    var colors = <Color>[
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.purple,
      Colors.green,
      Colors.teal,
      Colors.blue
    ];
    var tunes = ['DO', 'RE', 'MI', 'FA', 'SO', 'LA', 'SI'];
    for (var i = 0; i < 7; i++) {
      var e = Expanded(
        child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero, backgroundColor: colors[i]),
          onPressed: () {
            playSound(i + 1);
          },
          child: Text(
            tunes[i],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
      eps.add(e);
    }
    return eps;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: renderKey(),
    );
  }
}
