import 'package:flutter/material.dart';

import '../paddings.dart';

class TamamlananCard extends StatelessWidget {
  final Color color;
  const TamamlananCard({
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
      width: 150,
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
                    children: [Text("Burak Hacıoğlu")],
                  ),
                  Icon(
                    Icons.done,
                  )
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("madde açıklaması,")],
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
                  child: Text("11.12.2023"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
