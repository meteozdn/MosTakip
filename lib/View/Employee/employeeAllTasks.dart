import 'dart:io';

import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/components/cards/tamamlanan_card.dart';
import 'package:takip_sistem_mos/components/paddings.dart';

import '../../components/cards/list_tile.dart';

//import 'package:expansion_tile_card/expansion_tile_card.dart';

//import '../../components/clip_path.dart';

class EmployeeAllTasksPage extends StatefulWidget {
  const EmployeeAllTasksPage({super.key});

  @override
  State<EmployeeAllTasksPage> createState() => _EmployeeAllTasksPageState();
}

class _EmployeeAllTasksPageState extends State<EmployeeAllTasksPage> {
  File? images;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    @override
    List topCards = const [
      TamamlananCard(
        color: MosDestekColors.aliceBlue,
      ),
      TamamlananCard(
        color: MosDestekColors.aliceBlue,
      ),
    ];

    // double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ProjectPaddings.mainHorizontalPadding +
              ProjectPaddings.smallVerticalPadding,
          child: Text(
            "Tamamlananlar",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Expanded(
            flex: screenHeight < 670 ? 3 : 1,
            child: SizedBox(
              height: screenWidth / 3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topCards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return topCards[index];
                  }),
            )),
        Padding(
          padding: ProjectPaddings.mainHorizontalPadding +
              ProjectPaddings.smallTopPadding,
          child: Text(
            "Bekleyenler",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const Padding(
          padding: ProjectPaddings.mainHorizontalPadding,
          child: Divider(
            thickness: 2,
          ),
        ),
        Expanded(
          flex: screenHeight < 670 ? 7 : 4,
          child: Padding(
            padding: ProjectPaddings.mainHorizontalPadding,
            child: SizedBox(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ProjectListTile(icon: Icons.timer);
                  }),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> isTamamlaWidget(
    BuildContext context,
    double screenWidth,
  ) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              title: const Text('Talep oluşturun'),
              content: SizedBox(
                height: screenWidth / 1.3,
              ),
            ));
  }
}
