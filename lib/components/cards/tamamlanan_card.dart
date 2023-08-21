import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';

import '../../styles/paddings.dart';

class TopTaskCard extends StatelessWidget {
  final Color color;
  const TopTaskCard({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 5, top: 5),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(.0, 2.0), //(x,y)
          blurRadius: 6.0,
        ),
      ], color: color, borderRadius: BorderRadius.circular(15)),
      //color: Colors.red,
      // height: 150,
      width: 170,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: ProjectPaddings.mainHorizontalPadding / 3,
              child: const Stack(
                alignment: Alignment.centerRight,
                children: [
                  Row(
                    children: [
                      Text(
                        "Burak Hacıoğlu",
                        style: MosTextStyles.boldToryBlueTextStyle,
                      )
                    ],
                  ),
                  Icon(
                    Icons.timer,
                    color: MosDestekColors.toryBlue,
                  )
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "madde açıklamasıaç ıklamasıaç ıklaması,",
                overflow: TextOverflow.fade,
                maxLines: 3,
                softWrap: true,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    "11.12.2023",
                    style: MosTextStyles.boldToryBlueTextStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
