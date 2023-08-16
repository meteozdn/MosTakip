import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';

import '../paddings.dart';

class PersonDataCard extends StatelessWidget {
  //final Color color;
  const PersonDataCard({
    super.key,
    // required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(left: 20, bottom: 5, top: 5),
      decoration: BoxDecoration(
          border: Border.all(color: MosDestekColors.toryBlue, width: 3),
          color: MosDestekColors.white,
          borderRadius: BorderRadius.circular(20)),
      //color: Colors.red,
      // height: 150,
      //  width: 150,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                //height: 150,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: MosDestekColors.toryBlue, width: 3),
                    color: MosDestekColors.toryBlue,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10))),
                child: Padding(
                  padding: ProjectPaddings.mainHorizontalPadding / 3,
                  //ProjectPaddings.smallVerticalPadding / 10,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: MosDestekColors.white,
                        // radius: 30,
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: MosDestekColors.toryBlue),
                        ),
                      ),
                      Padding(
                        padding: ProjectPaddings.mainHorizontalPadding / 2,
                        child: Text(
                          "Metehan Özden",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: MosDestekColors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Row(
              children: [
                columnGeneratorMethod("Yanıtlama"),
                columnGeneratorMethod("Tamamlama"),
                columnGeneratorMethod("Deadline"),
                Expanded(
                  child: Container(
                    child: columnGeneratorMethod("Toplam"),
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(
                      color: MosDestekColors.toryBlue,
                      width: 3,
                    ))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding columnGeneratorMethod(String title) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text(title), Text(title), Text(title)],
      ),
    );
  }
}