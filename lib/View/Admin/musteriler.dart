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
    // TODO: implement initState
    fetchCompanies();
    //_chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  List<Company> companies = [];
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
          dataSource: companiesData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
        )
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData(companies[1].name, 10),
      GDPData('Evas', 12),
      GDPData('xy', 10),
      GDPData('zt', 30),
      GDPData('ab', 15),
    ];
    return chartData;
  }

  void fetchCompanies() async {
    const url = Services.companyUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      for (var element in json) {
        companies.add(Company.toCompany(element));
        companiesData.add(GDPData.toGDPData(element));
      }
    });
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;

  static toGDPData(map) {
    return GDPData(map['name'], 10);
  }
}
