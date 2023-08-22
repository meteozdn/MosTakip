import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/components/cards/person_data_card.dart';
import 'package:takip_sistem_mos/models/task_model.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../components/cards/list_tile.dart';
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
  List<GDPData> _chartData = [];
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    fetchCompanies();

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
                      return ProjectListTile(
                          ontap: () {
                            print(employeeTasks[index].isDone);
                          },
                          color: employeeTasks[index].isDone
                              ? Colors.green
                              : Colors.red,
                          title: employeeTasks[index].description,
                          subTitle: employeeTasks[index].respUserID.toString(),
                          icon: employeeTasks[index].isDone
                              ? Icons.check
                              : Icons.close);
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

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Kalyon', 15),
      GDPData('Evas', 3),
      GDPData('İç görevler', 6),
    ];
    return chartData;
  }

  void fetchCompanies() async {
    const url = Services.tasksUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      for (var element in json) {
        // print(element['employee_Id']);
        if (element['employee_Id'] == widget.employee.id) {
          employeeTasks.add(TaskModel.toTask(element));
        }

        //  companiesData.add(GDPData.toGDPData(element));
      }
    });
    _chartData = getChartData();
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
  //final Color color;
}
