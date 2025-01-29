import 'package:flutter/material.dart';

// FlutterError
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Card(
              color: Colors.cyanAccent,
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
                      onTap: () {},
                    ),
                    InkWell(
                      child: Image.asset("assets/images/gallery-100.png",
                          width: 50, height: 50),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
