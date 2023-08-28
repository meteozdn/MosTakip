import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/components/cards/list_tile_wiith_image.dart';
import 'package:takip_sistem_mos/components/cards/person_data_card.dart';
import 'package:takip_sistem_mos/models/task_model.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../models/costumer.dart';
import '../../models/employee.dart';
import '../../services/services.dart';
//import '../../Assets/colors.dart';

class CalisanViewPage extends StatefulWidget {
  const CalisanViewPage({super.key, required this.employee});
  final Employee employee;

  @override
  State<CalisanViewPage> createState() => _CalisanViewPageState();
}

class _CalisanViewPageState extends State<CalisanViewPage> {
  List<TaskModel> employeeTasks = [];
  List<Company> companies = [];
  List<GDPData> _chartData = [];
  Map<String, int> _companiesWcount = {};
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    fetchData();
    //print(companies);

    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.employee.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: screenHeight < 670 ? 7 : 3,
              child: PageView(
                children: [
                  Padding(
                      padding: ProjectPaddings.mainHorizontalPadding +
                          ProjectPaddings.smallVerticalPadding,
                      child: PersonDataCard(
                        employee: widget.employee,
                        isCircularAvatar: true,
                        tasklist: employeeTasks,
                      )),
                  firmalarCircularChart(),
                ],
              )),
          const Padding(
            padding: ProjectPaddings.mainHorizontalPadding,
            // ProjectPaddings.smallTopPadding,
            child: Divider(
              color: MosDestekColors.toryBlue,
              thickness: 1,
            ),
          ),
          Padding(
            padding: ProjectPaddings.mainHorizontalPadding +
                ProjectPaddings.smallVerticalPadding,
            child: const Text(MosTexts.allTasks,
                style: MosTextStyles.mosMediumHeadline),
          ),
          Expanded(
            flex: screenHeight < 670 ? 8 : 7,
            child: Padding(
              padding: ProjectPaddings.mainHorizontalPadding,
              child: SizedBox(
                //  height: screenHeight * 0.7,
                child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    itemCount: employeeTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ImageListTile(
                        imagePath: getCompany(
                                employeeTasks[index].reqUserID, companies)
                            .image,
                        trailingIcon: employeeTasks[index].isDone
                            ? Icons.check
                            : Icons.close,
                        color: employeeTasks[index].isDone
                            ? Colors.green
                            : Colors.red,
                        title: getCompany(
                                employeeTasks[index].reqUserID, companies)
                            .name,
                        subTitle: employeeTasks[index].description,
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SfCircularChart firmalarCircularChart() {
    return SfCircularChart(
      tooltipBehavior: _tooltipBehavior,
      legend: const Legend(
          isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: <CircularSeries>[
        PieSeries<GDPData, String>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          enableTooltip: true,
          dataSource: _chartData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
        )
      ],
    );
  }

  Company getCompany(int taskid, List<Company> list) {
    for (var element in list) {
      if (element.id == taskid) {
        return element;
      }
    }
    return Company.mosCompany();
  }

  void fetchData() async {
    final taskUrl = await Services.getData(Services.tasksUrl);
    final companyUrl = await Services.getData(Services.companyUrl);

    setState(() {
      for (var element in taskUrl) {
        if (element['employee_Id'] == widget.employee.id) {
          employeeTasks.add(TaskModel.toTask(element));
        }
      }
      for (var element in companyUrl) {
        companies.add(Company.toCompany(element));
      }
      for (var task in employeeTasks) {
        for (var company in companies) {
          if (task.reqUserID == company.id) {
            if (_companiesWcount.containsKey(company.name)) {
              _companiesWcount.update(
                  company.name, (int a) => _companiesWcount[company.name]! + 1);

              continue;
            } else {
              _companiesWcount[company.name] = 1;
            }
            continue;
          }
        }
      }
      _companiesWcount.forEach((key, value) {
        _chartData.add(GDPData(key, value.toDouble()));
      });
    });
    // _chartData = getChartData();
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
  //final Color color;
}
