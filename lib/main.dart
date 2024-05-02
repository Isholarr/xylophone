import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final List<Color> colors = [
    Colors.white,
    Colors.red,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.black,
    Colors.pink,
  ];

  final List<String> text = ['Doh', 'Re', 'Mi', 'Fa', 'So', 'La', 'Ti'];

  void hitSound(int sound) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$sound.wav'));
    await player.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          centerTitle: true,
          title: const Text('xylo'),
        ),
        body: ListView.builder(
            itemCount: 7,
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.all(20),
                color: colors[index],
                child: TextButton(
                  onPressed: () => hitSound(index + 1),
                  child: Text(text[index]),
                ),
              );
            })),
      ),
    );
  }
}
