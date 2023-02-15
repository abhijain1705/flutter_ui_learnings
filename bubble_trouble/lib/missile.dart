import 'package:flutter/material.dart';

class MyMissile extends StatelessWidget {
  const MyMissile({
    super.key,
    required this.missileX,
    required this.missileHeight,
  });

  final double missileX;
  final double missileHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(missileX, 1),
      child: Container(
        width: 5,
        height: missileHeight,
        color: Colors.grey,
      ),
    );
  }
}
