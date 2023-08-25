import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:takip_sistem_mos/View/Admin/calisan_view.dart';
import 'package:takip_sistem_mos/models/employee.dart';
import 'package:takip_sistem_mos/services/services.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import 'package:http/http.dart' as http;
import '../../Assets/colors.dart';
import '../../components/cards/list_tile.dart';
import '../../components/cards/list_tile_wiith_image.dart';
import '../../components/cards/person_data_card.dart';
import '../../models/task_model.dart';

class CalisanlarPage extends StatefulWidget {
  const CalisanlarPage({super.key});

  @override
  State<CalisanlarPage> createState() => _CalisanlarPageState();
}

class _CalisanlarPageState extends State<CalisanlarPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true);

    fetchEmployee();
  }

  Map<String, int> _compWcount = {};
  List<TaskModel> tasks = [];
  List<_ChartData> _chartData = [];
  // List<Company> companies = [];
  List<Employee> employees = [];
  @override
  Widget build(BuildContext context) {
    //  double screenWidth = MediaQuery.of(context).size.width;

    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: screenHeight < 670 ? 4 : 2,
            child: Padding(
              padding: ProjectPaddings.mainHorizontalChart +
                  ProjectPaddings.smallTopPadding,
              child: SizedBox(child: employeeChart()),
            ) //SizedBox() // firmalarCircularChart()
            ),
        Padding(
          padding: ProjectPaddings.mainHorizontalPadding +
              ProjectPaddings.smallTopPadding,
          child: const Divider(
            color: MosDestekColors.toryBlue,
            thickness: 1,
          ),
        ),
        Padding(
          padding: ProjectPaddings.mainHorizontalPadding +
              ProjectPaddings.smallVerticalPadding,
          child: const Text(
            MosTexts.employeeText,
            style: MosTextStyles.mosMediumHeadline,
          ),
        ),
        Expanded(
          flex: screenHeight < 670 ? 6 : 4,
          child: Padding(
            padding: ProjectPaddings.mainHorizontalPadding,
            child: SizedBox(
              //  height: screenHeight * 0.7,
              child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  itemCount: employees.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ImageListTile(
                      isCircularAvatar: true,
                      title: employees[index].name,
                      subTitle: employees[index].email,
                      imagePath: employees[index].avatar,
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CalisanViewPage(
                            employee: employees[index],
                          ),
                        ));
                        //  fetchCompany();
                      },
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }

  SfCartesianChart employeeChart() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
        tooltipBehavior: _tooltip,
        title: ChartTitle(
            text: 'Tüm Performanslar',
            textStyle: MosTextStyles.boldToryBlueTextStyle),
        series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
              dataSource: _chartData,
              sortingOrder: SortingOrder.descending,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              sortFieldValueMapper: (_ChartData data, _) => data.y,
              name: 'Başarılı',
              color: MosDestekColors.toryBlue)
        ]);
  }

  void fetchEmployee() async {
    final empUrl = await Services.getData(Services.employeesUrl);
    final taskUrl = await Services.getData(Services.tasksUrl);

    setState(() {
      for (var element in empUrl) {
        employees.add(Employee.toEmployee(element));
      }

      for (var element in taskUrl) {
        // print(element);
        tasks.add(TaskModel.toTask(element));
      }

      //  print(_compWcount);
      for (var task in tasks) {
        print(task.respUserID);
        for (var user in employees) {
          if (user.id == task.respUserID) {
            if (_compWcount.containsKey(user.name.split(' ')[0])) {
              _compWcount.update(user.name.split(' ')[0],
                  (int) => _compWcount[user.name.split(' ')[0]]! + 1);

              continue;
            } else {
              _compWcount[user.name.split(' ')[0]] = 1;
            }
            continue;
          }
        }
      }
      // print(_compWcount);
      _compWcount.forEach((key, value) {
        _chartData.add(_ChartData(key, value.toDouble()));
      });
    });
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
