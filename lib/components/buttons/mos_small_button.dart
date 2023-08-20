import 'package:flutter/cupertino.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';

class MosSmallButton extends StatelessWidget {
  const MosSmallButton({
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
//  Color backgroundColor:

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color, // Colors.black, MosDestekColors.toryBlue,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        width: screenWidth * 1.5,
        height: screenWidth * 0.12,
        child: Text(
          text,
          style: MosTextStyles.boldWhiteTextStyle,
        ),
      ),
    );
  }
}
