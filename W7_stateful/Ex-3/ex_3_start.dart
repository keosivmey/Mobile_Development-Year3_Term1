import 'package:flutter/material.dart';

List<String> images = [
  "assets/w7_ex3/bird.jpg",
  "assets/w7_ex3/bird2.jpg",
  "assets/w7_ex3/insect.jpg",
  "assets/w7_ex3/girl.jpg",
  "assets/w7_ex3/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageChanging(),
  ),
);

class ImageChanging extends StatefulWidget {
  const ImageChanging({super.key});

  @override
  State<ImageChanging> createState() => _ImageChangingState();
}

class _ImageChangingState extends State<ImageChanging> {
  int currentImage = 0;

  void nextImage() {
    setState(() {
      currentImage = (currentImage + 1) % images.length; 
    });
  }

  void previousImage() {
    setState(() {
      currentImage = (currentImage - 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text("Image Viewer"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: "Go to the next image",
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentImage]),
    );
  }
}