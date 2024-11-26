import 'package:flutter/material.dart';
import 'full_screen_image_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/image_0.jpeg',
    'assets/images/image_1.jpg',
    'assets/images/image_2.jpeg',
    'assets/images/image_3.png',
    'assets/images/image_4.jpeg',
    'assets/images/image_5.jpeg',
    'assets/images/image_6.jpeg',
    'assets/images/image_7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Center(
            child: const Text('Image Gallery')
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImageView(
                        images: imageUrls,
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),

              );
            },
          ),
        ),
      ),
    );
  }
}
