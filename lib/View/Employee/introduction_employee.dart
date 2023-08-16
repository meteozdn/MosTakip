import 'package:flutter/material.dart';
import '../../../Assets/Images/images.dart';
import '../../../Assets/colors.dart';
import '../../components/indicators.dart';
import '../Company/introduction.dart';
import 'controller/employee_controller.dart';

class IntroductionEmployeePage extends StatefulWidget {
  const IntroductionEmployeePage({super.key});

  @override
  State<IntroductionEmployeePage> createState() =>
      _IntroductionEmployeePageState();
}

class _IntroductionEmployeePageState extends State<IntroductionEmployeePage> {
  int _selectedIndexcard = 0;
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //  double screenHeight = MediaQuery.of(context).size.height;

    List<Widget> cards = [
      IntroductionViewWidget(
        color: MosDestekColors.tulipTree,
        description:
            "Curabitur vitae urna nec orci placerat sodales porta quis nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce feugiat efficitur nunc eu commodo. Nullam sit amet lectus a dui finibus vestibulum. Aliquam efficitur lectus mauris, vehicula mollis mi pellentesque euismod. ",
        title: "HIZLI",
        screenWidth: screenWidth,
        image: AssetIllustraions.teamworkCollaboration,
        titleColor: MosDestekColors.tulipTree,
      ),
      IntroductionViewWidget(
        description:
            "Curabitur vitae urna nec orci placerat sodales porta quis nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce feugiat efficitur nunc eu commodo. Nullam sit amet lectus a dui finibus vestibulum. Aliquam efficitur lectus mauris, vehicula mollis mi pellentesque euismod. ",
        title: "GÜVENLİ",
        screenWidth: screenWidth,
        image: AssetIllustraions.creative,
        color: MosDestekColors.tulipTree,
        titleColor: MosDestekColors.tulipTree,
      ),
      IntroductionViewWidget(
        description:
            "Curabitur vitae urna nec orci placerat sodales porta quis nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce feugiat efficitur nunc eu commodo. Nullam sit amet lectus a dui finibus vestibulum. Aliquam efficitur lectus mauris, vehicula mollis mi pellentesque euismod. ",
        title: "KOLAY",
        screenWidth: screenWidth,
        image: AssetIllustraions.idea,
        color: MosDestekColors.tulipTree,
        titleColor: MosDestekColors.tulipTree,
      ),
    ];

    return Container(
      color: MosDestekColors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: MosDestekColors.white,
            body: Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      width: screenWidth,
                      height: screenWidth,
                      child: PageView.builder(
                        onPageChanged: (index) {
                          setState(() {
                            _selectedIndexcard = index;
                          });
                        },
                        controller: PageController(viewportFraction: 1),
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                          var card = cards[index];
                          // var _scale = _selectedIndex == index ? 1.0 : 0.8;
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: card,
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        cards.length,
                        (index) => ProjectIndicator(
                          isActive: _selectedIndexcard == index ? true : false,
                          activeColor: MosDestekColors.tulipTree,
                          inActiveColor: MosDestekColors.toryBlue,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          /*
                          onPressed: () {
                            print(_selectedIndexcard);
                            setState(() {
                              _selectedIndexcard += 1;
                            });
                          }
                          */
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EmployeeController(),
                            ));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MosDestekColors.toryBlue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          ),
                          child: const Text(
                            "Tamam",
                            style: TextStyle(color: MosDestekColors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
