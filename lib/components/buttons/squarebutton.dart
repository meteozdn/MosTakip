import 'package:flutter/material.dart';

import '../../Assets/colors.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({
    required this.icon,
    required this.onTap,
    super.key,
  });
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: MosDestekColors.toryBlue,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            icon,
            color: MosDestekColors.white,
          ),
        ),
      ),
    );
  }
}
