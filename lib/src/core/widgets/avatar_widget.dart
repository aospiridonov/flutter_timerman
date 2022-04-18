import 'dart:io';

import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff8F8F8F);

    return Center(
      child: Stack(
        children: [
          _buildImage(color),
          Positioned(
            right: 0,
            bottom: 0,
            child: _buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(Color color) {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(
            File(imagePath),
          );

    return CircleAvatar(
      radius: 62,
      backgroundColor: const Color(0xffF2F2F2),
      child: CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 60,
      ),
    );
  }

  Widget _buildEditIcon(Color iconColor) {
    return CircleAvatar(
      radius: 17,
      backgroundColor: const Color(0xffF2F2F2),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: const Color(0xFFF9F9F9),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.add_rounded),
          color: iconColor,
          iconSize: 32,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
