// ignore_for_file: unused_local_variable, avoid_print

import 'dart:io';
// ignore: unused_import
import 'dart:math';
// import 'com.google.mlkit.vision.text.TextRecognition';
// import 'com.google.mlkit.vision.text.TextRecognizer';
// import 'com.google.mlkit.vision.text.latin.TextRecognizerOptions';
import 'package:flutter/services.dart';
import 'package:google_mlkit_entity_extraction/google_mlkit_entity_extraction.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cardscanner extends StatefulWidget {
  File image;
  Cardscanner(this.image, {super.key});

  @override
  State<Cardscanner> createState() => _CardscannerState();
}

class _CardscannerState extends State<Cardscanner> {
  late TextRecognizer textRecognizer;
  late EntityExtractor entityExtractor;

  @override
  void initState() {
    super.initState();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    entityExtractor =
        EntityExtractor(language: EntityExtractorLanguage.english);
    print("TextRecognizer and EntityExtractor initialized");
    doTextRecognition();
  }

// snackbar
  void showCustomSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.info,
              color: Colors.white, size: 20), // Equivalent to .info__icon
          SizedBox(width: 8),
          Text(
            message,
            style: TextStyle(
              fontSize: 14, // Equivalent to .info__title
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: Icon(Icons.close,
                color: Colors.white, size: 20), // Equivalent to .info__close
          ),
        ],
      ),
      backgroundColor: Color(0xFF509AF8), // Equivalent to .info background
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8)), // Equivalent to .info border-radius
      margin: EdgeInsets.all(12),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String results = "";

// not working as intended
  doTextRecognition() async {
    InputImage inputImage = InputImage.fromFile(widget.image);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    results = recognizedText.text;

    final List<EntityAnnotation> annotations =
        await entityExtractor.annotateText(results);

    results = "";
    for (final annotation in annotations) {
      annotation.start;
      annotation.end;
      annotation.text;
      for (final entity in annotation.entities) {
        results += "${entity.type.name}\n${entity.rawValue}\n\n";
      }
    }

    print(results);
    setState(() {
      results;
    });
  }

  /// not working as intended

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 175, 224),
        title: Center(
            child: Text(
          "Scanner",
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
                        // InkWell(
                        //   onTap: () {
                        //     Clipboard.setData(ClipboardData(text: results));
                        //     SnackBar sn = SnackBar(content: Text("Copied"));
                        //     ScaffoldMessenger.of(context).showSnackBar(sn);
                        //   },
                        //   child: Image.asset("assets/images/copy-50.png",
                        //       width: 30, height: 30),
                        // ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: results));
                            showCustomSnackBar(context, "Copied to clipboard!");
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
                    child: Text(
                      results,
                      style: TextStyle(fontSize: 18),
                    ),
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
