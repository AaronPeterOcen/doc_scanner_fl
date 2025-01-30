// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:math';
// import 'com.google.mlkit.vision.text.TextRecognition';
// import 'com.google.mlkit.vision.text.TextRecognizer';
// import 'com.google.mlkit.vision.text.latin.TextRecognizerOptions';
import 'package:flutter/services.dart';
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

  String results = "";

  doTextRecognition() async {
    InputImage inputImage = InputImage.fromFile(widget.image);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    results = recognizedText.text;
    // String text = recognizedText.text;
    print(results);
    setState(() {
      results;
    });

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
        backgroundColor: const Color.fromARGB(255, 76, 175, 224),
        title: Center(
            child: Text(
          "Recognition",
          style: TextStyle(color: Colors.white),
        )),
      ),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.file(widget.image)),
            Card(
              margin: EdgeInsets.all(10),
              color: Colors.white70,
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 76, 175, 224),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/scanning-100.png",
                            width: 30, height: 30),
                        Text("Results",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: results));
                            SnackBar sn = SnackBar(content: Text("Copied"));
                            ScaffoldMessenger.of(context).showSnackBar(sn);
                          },
                          child: Image.asset("assets/images/copy-50.png",
                              width: 30, height: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(results, style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
