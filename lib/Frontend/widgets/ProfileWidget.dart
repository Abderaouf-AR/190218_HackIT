import 'dart:io';

import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          // buildImage(),
          Avatar(
            sources: [
              GitHubSource('luckyseven'),
              InstagramSource(
                  'alberto.fecchi'), // Fallback if GitHubSource is not available
            ],
            name:
            'Alberto Fecchi', // Fallback if no image source is available
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }


  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}