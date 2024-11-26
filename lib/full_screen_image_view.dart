import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_view/photo_view.dart';


class FullScreenImageView extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageView({
    Key? key,
    required this.images,
    required this.initialIndex,
  }) : super(key: key);

  @override
  _FullScreenImageViewState createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Image ${currentIndex + 1}'),
      ),
      body: PhotoViewGallery.builder(
        itemCount: widget.images.length,
        pageController: PageController(initialPage: widget.initialIndex),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(widget.images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2.0,
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black, // Adds a black background for the full-screen view
        ),
      ),
    );
  }
}
