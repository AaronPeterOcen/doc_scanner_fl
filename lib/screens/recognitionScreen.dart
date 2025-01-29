import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Recognitionscreen extends StatefulWidget {
  File image;
  Recognitionscreen(this.image, {super.key});

  @override
  State<Recognitionscreen> createState() => _RecognitionscreenState();
}

class _RecognitionscreenState extends State<Recognitionscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
            child: Text(
          "Recognition",
          style: TextStyle(color: Colors.white70),
        )),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Image.file(widget.image),
      ),
    );
  }
}
