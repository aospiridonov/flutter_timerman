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
    const color = Color.fromRGBO(64, 105, 225, 1);
    return Center(
      child: Stack(
        children: [
          _buildImage(color),
          Positioned(
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
      radius: 75,
      backgroundColor: color,
      child: CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 70,
      ),
    );
  }

  Widget _buildEditIcon(Color color) => _buildCircle(
        all: 8,
        child: Icon(
          Icons.edit,
          color: color,
          size: 20,
        ),
      );
  Widget _buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: Colors.white,
          child: child,
        ),
      );
}
