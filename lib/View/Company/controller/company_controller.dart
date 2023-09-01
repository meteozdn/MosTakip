import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/models/costumer.dart';
import 'package:takip_sistem_mos/models/task_model.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import '../../../../Assets/colors.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';
import '../../../components/buttons/mos_small_button.dart';
import '../../../components/cards/list_tile.dart';
import '../../../components/cards/tamamlanan_card.dart';
import '../../../components/texts/text.dart';
import '../../../services/services.dart';

class CompanyController extends StatefulWidget {
  const CompanyController({super.key});
  @override
  State<CompanyController> createState() => _CompanyControllerState();
}

class _CompanyControllerState extends State<CompanyController> {
  TextEditingController _controller = TextEditingController();
  final customer = Company(
      id: 2,
      name: "EVAS",
      image: "https://www.evas.com.tr/assets/images/logo.png",
      country: "Turkey",
      city: "Istanbul",
      key: 11233);
  List<TaskModel> tasksFinish = [];
  List<TaskModel> tasksWaitings = [];
  void fetchTasks() async {
    final taskUrl = await Services.getData(Services.tasksUrl);
    setState(() {
      for (var element in taskUrl) {
        if (element["musteriId"] == customer.id) {
          if (element["isDone"] == false) {
            tasksWaitings.add(TaskModel.toTask(element));
            print(tasksWaitings[0].id);
          } else {
            tasksFinish.add(TaskModel.toTask(element));
            // print(tasksFinish[0].id);
          }
        }
      }
    });

    print(tasksWaitings.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    const String title = "Çağrı Talebi Oluşturun";

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: MosDestekColors.toryBlue,
          onPressed: () {
            showDialogWidget(context, screenWidth);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: false,
          actions: [
            Padding(
              padding: ProjectPaddings.mainHorizontalPadding,
              child: CircleAvatar(
                backgroundColor: MosDestekColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.network(customer.image),
                ),
              ),
            )
          ],
          backgroundColor: MosDestekColors.toryBlue,
          title: const Text(
            title,
          ),
        ),
        backgroundColor: MosDestekColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: ProjectPaddings.mainHorizontalPadding +
                  ProjectPaddings.smallVerticalPadding,
              child: const Text(
                MosTexts.waitingText,
                style: MosTextStyles.mosMediumHeadline,
              ),
            ),
            Expanded(
                flex: screenHeight < 670 ? 3 : 1,
                child: SizedBox(
                  height: screenWidth / 3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tasksWaitings.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TopTaskCard(
                          name: "Evas",
                          color: MosDestekColors.aliceBlue,
                          task: tasksWaitings[index],
                        );
                      }),
                )),
            Padding(
              padding: ProjectPaddings.mainHorizontalPadding +
                  ProjectPaddings.smallTopPadding,
              child: const Divider(
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: ProjectPaddings.mainHorizontalPadding +
                  ProjectPaddings.smallVerticalPadding,
              child: const Text(
                MosTexts.completeText,
                style: MosTextStyles.mosMediumHeadline,
              ),
            ),
            Expanded(
              flex: screenHeight < 670 ? 7 : 4,
              child: Padding(
                padding: ProjectPaddings.mainHorizontalPadding,
                child: SizedBox(
                  //  height: screenHeight * 0.7,
                  child: ListView.builder(
                      itemCount: tasksFinish.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProjectListTile(
                          title: tasksFinish[index].description,
                          subTitle: tasksFinish[index].isRespOnTime
                              ? "Zamanında"
                              : "Geç",
                          icon: tasksFinish[index].isRespOnTime
                              ? Icons.alarm_on_outlined
                              : Icons.alarm_off,
                          color: tasksFinish[index].isRespOnTime
                              ? MosDestekColors.green
                              : MosDestekColors.red,
                        );
                      }),
                ),
              ),
            ),
          ],
        ));
  }

  Future<dynamic> showDialogWidget(
    BuildContext context,
    double screenWidth,
  ) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              title: const Text(
                MosTexts.addCallText,
                style: MosTextStyles.boldToryBlueTextStyle,
              ),
              content: SizedBox(
                height: screenWidth * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: _controller,
                      style: const TextStyle(),
                      maxLines: 7,
                    ),
                    Padding(
                      padding: ProjectPaddings.smallTopPadding,
                      child: MosSmallButton(
                          onTap: () {
                            setState(() {
                              postData(_controller.text);
                              _controller.text = "";
                            });
                          },
                          screenWidth: screenWidth,
                          text: MosTexts.sendText,
                          color: MosDestekColors.toryBlue),
                    )
                  ],
                ),
              ),
            ));
  }

  postData(String desc) async {
    var response = await http.post(Uri.parse(Services.tasksUrl), body: {
      "musteriId": "${customer.id}",
      "description": desc,
      "recTime": "1692735282",
      "employee_Id": "2",
      "isDone": "false",
      "ontime": "false",
      "onDeadline": "true",
      "isDeadline": "true",
      //  "cagriId": "30"
    });
    return response;
  }
}
