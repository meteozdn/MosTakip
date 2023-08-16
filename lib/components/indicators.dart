import 'package:flutter/material.dart';

class ProjectIndicator extends StatelessWidget {
  final bool isActive;
  const ProjectIndicator({
    super.key,
    required this.isActive,
    required this.inActiveColor,
    required this.activeColor,
  });
  final Color activeColor;
  final Color inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.all(8),
      width: isActive ? 40.0 : 10.0,
      height: 10.0,
      decoration: BoxDecoration(
          color: isActive ? activeColor : inActiveColor,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
