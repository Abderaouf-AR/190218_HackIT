import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const RadialGradient(
          center: Alignment.topLeft,
          radius: 1.0,
          colors: <Color>[Colors.green, Colors.indigo],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: Image.asset("assets/images/back1.jpg"),
    );
  }
}
