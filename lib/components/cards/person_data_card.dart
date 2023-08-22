import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/models/employee.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';

import '../../styles/paddings.dart';

class PersonDataCard extends StatelessWidget {
  final Employee employee;
  String? text;
  bool isCircularAvatar;
  PersonDataCard({
    this.isCircularAvatar = false,
    required this.employee,
    this.text,
    super.key,
    // required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
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
          SizedBox(
            width: screenWidth,
            child: Stack(
              children: [
                Container(
                  //height: 150,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: MosDestekColors.toryBlue, width: 3),
                      color: MosDestekColors.toryBlue,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10))),
                  child: Padding(
                    padding: ProjectPaddings.mainHorizontalPadding / 3,
                    //ProjectPaddings.smallVerticalPadding / 10,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: MosDestekColors.white,
                          // radius: 30,
                          child: isCircularAvatar
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(employee.avatar),
                                )
                              : Text(
                                  text != null ? text! : "1",
                                  style: MosTextStyles.midToryBlueTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                        ),
                        Padding(
                          padding: ProjectPaddings.mainHorizontalPadding / 2,
                          child: Text(
                            employee.name,
                            style: MosTextStyles.boldWhiteTextStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                columnGeneratorMethod("Yanıtlama"),
                columnGeneratorMethod("Tamamlama"),
                columnGeneratorMethod("Deadline"),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(
                      color: MosDestekColors.toryBlue,
                      width: 3,
                    ))),
                    child: columnGeneratorMethod("Toplam"),
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
        children: [
          Text(
            title,
            style: MosTextStyles.boldToryBlueTextStyle,
          ),
          Text(
            title,
            // style: MosTextStyles.,
          ),
          Text(
            title,
            // style: MosTextStyles.boldToryBlueTextStyle,
          )
        ],
      ),
    );
  }
}
