import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Carousel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> _images = [
    'assets/avatar1.PNG',
    'assets/avatar2.PNG',
    'assets/avatar3.png',
    'assets/avatar4.PNG',
    'assets/avatar5.PNG',
  ];
  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _images.length) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Carousel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            _images[_currentIndex],
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _previousImage,
                child: const Text('Previous'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _nextImage,
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}