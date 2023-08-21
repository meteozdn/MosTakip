import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../components/cards/list_tile.dart';
//import '../../Assets/colors.dart';

class MusterilerPage extends StatefulWidget {
  const MusterilerPage({super.key});

  @override
  State<MusterilerPage> createState() => _MusterilerPageState();
}

class _MusterilerPageState extends State<MusterilerPage> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

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
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return ProjectListTile(
                        title: "Müşteri${index}",
                        subTitle: "Müşteri aciklama${index}",
                        icon: Icons.account_circle);
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

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Kalyon', 10),
      GDPData('Evas', 12),
      GDPData('xy', 10),
      GDPData('zt', 30),
      GDPData('ab', 15),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
