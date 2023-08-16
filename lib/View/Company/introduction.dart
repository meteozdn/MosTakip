import 'package:flutter/material.dart';
import '../../../Assets/Images/images.dart';
import '../../../Assets/colors.dart';
import 'package:takip_sistem_mos/View/Company/controller/company_controller.dart';
import '../../components/indicators.dart';

//TODO TANITIM SAYFASI OLACAK RESPONSİVE OLACAK
class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
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
                              builder: (context) => const CompanyController(),
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

class IntroductionViewWidget extends StatelessWidget {
  const IntroductionViewWidget({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.title,
    required this.color,
    required this.description,
    required this.titleColor,
  });
  final Image image;
  final String title;
  final String description;
  final double screenWidth;
  final Color color;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth / 2.5,
                backgroundColor: color,
                // child: const Text('AH'),
              ),
              image,
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: MosDestekColors.toryBlue,
                  // border: Border.all(width: 4, color: MosDestekColors.toryBlue),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(description,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: MosDestekColors.white,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
