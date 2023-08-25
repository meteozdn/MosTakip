import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/models/employee.dart';
import 'package:takip_sistem_mos/models/task_model.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';

import '../../styles/paddings.dart';

class PersonDataCard extends StatelessWidget {
  final Employee employee;
  final List<TaskModel> tasklist;
  Color? color;
  String? text;
  bool isCircularAvatar;
  PersonDataCard({
    this.isCircularAvatar = false,
    required this.employee,
    required this.tasklist,
    this.text,
    this.color = MosDestekColors.toryBlue,
    super.key,
    // required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    List<TaskModel> tasks = [
      TaskModel(
          id: 1,
          reqUserID: 2,
          respUserID: 2,
          isRespOnTime: false,
          isDone: true,
          isInDeadline: false,
          description: "description"),
      TaskModel(
          id: 2,
          reqUserID: 1,
          respUserID: 2,
          isRespOnTime: false,
          isDone: true,
          isInDeadline: true,
          description: "description"),
      TaskModel(
          id: 3,
          reqUserID: 2,
          respUserID: 2,
          isRespOnTime: true,
          isDone: true,
          isInDeadline: false,
          description: "description"),
      TaskModel(
          id: 3,
          reqUserID: 2,
          respUserID: 2,
          isRespOnTime: true,
          isDone: true,
          isInDeadline: false,
          description: "description")
    ];

    return Container(
      // margin: const EdgeInsets.only(left: 20, bottom: 5, top: 5),
      decoration: BoxDecoration(
          border: Border.all(color: color!, width: 3),
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
                      border: Border.all(color: color!, width: 3),
                      color: color,
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
                                      .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        Padding(
                          padding: ProjectPaddings.mainHorizontalPadding / 2,
                          child: Text(
                            employee.name,
                            style: MosTextStyles.boldWhiteTextStyle,
                          ),
                        ),
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
                columnGeneratorMethod(
                    "Yanıtlama", tasklist, SuccessType.onTime),
                columnGeneratorMethod(
                    "Tamamlama", tasklist, SuccessType.isDone),
                columnGeneratorMethod(
                    "Deadline", tasklist, SuccessType.deadline),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                      color: color!,
                      width: 3,
                    ))),
                    child: columnGeneratorMethod(
                        "Toplam", tasklist, SuccessType.total),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding columnGeneratorMethod(
      String title, List<TaskModel> list, SuccessType type) {
    int total = 0;
    int trues = 0;
    //  print(type);
    calculateSuccessdeadline() {
      //   print(type);
      for (var task in list) {
        if (task.isInDeadline) {
          total++;
          if (task.isDone) {
            trues++;
          }
        }
      }
      return;
    }

    calculateisRespOnTime() {
      for (var task in list) {
        if (!task.isInDeadline) {
          total++;
          if (task.isRespOnTime) {
            trues++;
          }
        }
      }
      return;
    }

    calculateisDone() {
      for (var task in list) {
        if (!task.isInDeadline) {
          total++;
          if (task.isDone) {
            trues++;
          }
        }
      }
      return;
    }

    calculateTotal() {
      for (var task in list) {
        if (!task.isInDeadline) {
          total++;
          total++;
        }
        if (task.isInDeadline) {
          total++;
        }
        if (task.isDone) {
          trues++;
        }
        if (task.isRespOnTime && !task.isInDeadline) {
          trues++;
        }
      }
      return;
    }

    switch (type) {
      case SuccessType.isDone:
        calculateisDone();
        break;
      case SuccessType.deadline:
        calculateSuccessdeadline();
        break;

      case SuccessType.onTime:
        calculateisRespOnTime();

        break;
      case SuccessType.total:
        calculateTotal();
        break;
      default:
    }

    //  calculateSuccessdeadline();
    String str = ((trues / total) * 100).toStringAsFixed(1);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: MosTextStyles.boldToryBlueTextStyle.copyWith(color: color!),
          ),
          Text(
            "${trues.toString()}/${total.toString()}",
            // style: MosTextStyles.,
          ),
          Text(
            str,
            // style: MosTextStyles.boldToryBlueTextStyle,
          )
        ],
      ),
    );
  }
}

class Success {
  final bool success;
  final bool falseType;
  final bool trueType;

  final String name;

  Success({
    required this.name,
    required this.success,
    required this.falseType,
    required this.trueType,
  });
}

enum SuccessType {
  deadline,
  total,
  onTime,
  isDone,
}
