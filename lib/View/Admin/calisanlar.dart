import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/View/Admin/calisan_view.dart';
import 'package:takip_sistem_mos/components/styles/paddings.dart';
import 'package:takip_sistem_mos/components/styles/text_styles.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';

import '../../Assets/colors.dart';
import '../../components/cards/list_tile.dart';
import '../../components/cards/person_data_card.dart';

class CalisanlarPage extends StatefulWidget {
  const CalisanlarPage({super.key});

  @override
  State<CalisanlarPage> createState() => _CalisanlarPageState();
}

class _CalisanlarPageState extends State<CalisanlarPage> {
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
              padding: ProjectPaddings.midTopPadding,
              child: SizedBox(
                child: PageView.builder(
                    controller: PageController(viewportFraction: .9),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: ProjectPaddings.mainHorizontalPadding / 2.5,
                        child: PersonDataCard(),
                      );
                    }),
              ),
            )),
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
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return ProjectListTile(
                      icon: Icons.account_circle,
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CalisanViewPage(),
                        ));
                      },
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
