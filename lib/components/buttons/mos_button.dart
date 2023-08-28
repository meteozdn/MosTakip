import 'package:flutter/material.dart';

import '../../Assets/colors.dart';
import '../../styles/text_styles.dart';

class MosButton extends StatelessWidget {
  const MosButton({
    super.key,
    required this.onTap,
    required this.screenWidth,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
  final double screenWidth;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenWidth * 0.06,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Text(
          text,
          style: MosTextStyles.boldWhiteTextStyle,
        ),
      ),
    );
  }
}
