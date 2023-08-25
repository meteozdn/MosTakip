import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/components/cards/list_tile_wiith_image.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../components/cards/list_tile.dart';
import '../../models/costumer.dart';
import '../../models/employee.dart';
import '../../models/task_model.dart';
import '../../services/services.dart';
import 'package:http/http.dart' as http;

//import '../../Assets/colors.dart';

class MusterilerPage extends StatefulWidget {
  const MusterilerPage({super.key});

  @override
  State<MusterilerPage> createState() => _MusterilerPageState();
}

class _MusterilerPageState extends State<MusterilerPage> {
  // late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);

    fetchData();
  }

  List<Company> companies = [];
  List<GDPData> _chartData = [];
  Map<String, int> _companiesWcount = {};
  List<TaskModel> tasks = [];
  List<GDPData> companiesData = [];

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: screenHeight < 670 ? 7 : 4, child: firmalarCircularChart()),
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
          child: const Text(MosTexts.costumerText,
              style: MosTextStyles.mosMediumHeadline),
        ),
        Expanded(
          flex: screenHeight < 670 ? 6 : 4,
          child: Padding(
            padding: ProjectPaddings.mainHorizontalPadding,
            child: SizedBox(
              //  height: screenHeight * 0.7,
              child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  itemCount: companies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ImageListTile(
                        //  isCircularAvatar: true,
                        title: companies[index].name,
                        subTitle:
                            "${companies[index].country}/${companies[index].city}",
                        imagePath: companies[index].image);
                  }),
            ),
          ),
        ),
      ],
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

  void fetchData() async {
    final taskUrl = await Services.getData(Services.tasksUrl);
    final companyUrl = await Services.getData(Services.companyUrl);

    setState(() {
      for (var element in taskUrl) {
        // print(element);
        tasks.add(TaskModel.toTask(element));
      }
      for (var element in companyUrl) {
        companies.add(Company.toCompany(element));
      }
      //  print(_companiesWcount);
      for (var task in tasks) {
        for (var company in companies) {
          if (task.reqUserID == company.id) {
            if (_companiesWcount.containsKey(company.name)) {
              _companiesWcount.update(
                  company.name, (int) => _companiesWcount[company.name]! + 1);

              continue;
            } else {
              _companiesWcount[company.name] = 1;
            }
            continue;
          }
        }
      }
      print(_companiesWcount);
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
}
