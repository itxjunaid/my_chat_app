import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String? imagePath;
  final String defaultImagePath;
  final double radius;

  const CircularImage({
    Key? key,
    this.imagePath,
    required this.defaultImagePath,
    this.radius = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imagePath != null
          ? AssetImage(imagePath!)
          : AssetImage(defaultImagePath),
      onBackgroundImageError: (exception, stackTrace) =>
          const Icon(Icons.error),
    );
  }
}