import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// FlutterError
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ImagePicker imagePicker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: const Color.fromARGB(255, 12, 209, 209),
              child: SizedBox(
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/scanner-100.png",
                              width: 35, height: 35),
                          Text(
                            'Scan',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/scanning-100.png",
                              width: 35, height: 35),
                          Text(
                            "Recognize",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/camera-enhance-100.png",
                              width: 35, height: 35),
                          Text(
                            "Enhance",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
            Card(
                color: const Color.fromARGB(255, 8, 60, 88),
                child: Container(
                    height: MediaQuery.of(context).size.height - 290)),
            Card(
              color: const Color.fromARGB(255, 12, 209, 209),
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Image.asset("assets/images/rotate-left-100.png",
                          width: 50, height: 50),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Image.asset("assets/images/camera-100.png",
                          width: 50, height: 50),
                      onTap: () async {
                        XFile? xFile = await imagePicker.pickImage(
                            source: ImageSource.camera);
                      },
                    ),
                    InkWell(
                      child: Image.asset("assets/images/gallery-100.png",
                          width: 50, height: 50),
                      onTap: () async {
                        XFile? xFile = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
