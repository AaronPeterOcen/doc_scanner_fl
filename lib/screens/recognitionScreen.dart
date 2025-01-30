// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:math';
// import 'com.google.mlkit.vision.text.TextRecognition';
// import 'com.google.mlkit.vision.text.TextRecognizer';
// import 'com.google.mlkit.vision.text.latin.TextRecognizerOptions';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Recognitionscreen extends StatefulWidget {
  File image;
  Recognitionscreen(this.image, {super.key});

  @override
  State<Recognitionscreen> createState() => _RecognitionscreenState();
}

class _RecognitionscreenState extends State<Recognitionscreen> {
  late TextRecognizer textRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    doTextRecognition();
  }

  doTextRecognition() async {
    InputImage inputImage = InputImage.fromFile(widget.image);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    print(text);
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
  }

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
