import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import '../../../../Assets/colors.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';

import '../../../components/buttons/mos_small_button.dart';
import '../../../components/cards/list_tile.dart';
import '../../../components/cards/tamamlanan_card.dart';
import '../../../components/texts/text.dart';

class CompanyController extends StatefulWidget {
  const CompanyController({super.key});
  @override
  State<CompanyController> createState() => _CompanyControllerState();
}

class _CompanyControllerState extends State<CompanyController> {
  File? images;
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    const String title = "Çağrı Talebi Oluşturun";
    Future pickImage() async {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => images = imageTemporary);
    }

    @override
    List topCards = const [
      TopTaskCard(
        color: MosDestekColors.aliceBlue,
      ),
      TopTaskCard(
        color: MosDestekColors.aliceBlue,
      ),
      TopTaskCard(
        color: MosDestekColors.aliceBlue,
      ),
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: MosDestekColors.toryBlue,
          onPressed: () {
            showDialogWidget(context, screenWidth, pickImage);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: MosDestekColors.toryBlue,
          title: const Text(
            title,
          ),
        ),
        backgroundColor: MosDestekColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: ProjectPaddings.mainHorizontalPadding +
                  ProjectPaddings.smallVerticalPadding,
              child: const Text(
                MosTexts.waitingText,
                style: MosTextStyles.mosMediumHeadline,
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
              child: const Divider(
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: ProjectPaddings.mainHorizontalPadding +
                  ProjectPaddings.smallVerticalPadding,
              child: const Text(
                MosTexts.completeText,
                style: MosTextStyles.mosMediumHeadline,
              ),
            ),
            Expanded(
              flex: screenHeight < 670 ? 7 : 4,
              child: Padding(
                padding: ProjectPaddings.mainHorizontalPadding,
                child: SizedBox(
                  //  height: screenHeight * 0.7,
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return ProjectListTile(
                            title: "Tamamlanan İs${index}",
                            subTitle: "Tamamlanan İs subtitle${index}",
                            icon: Icons.done);
                      }),
                ),
              ),
            ),
          ],
        ));
  }

  Future<dynamic> showDialogWidget(
      BuildContext context, double screenWidth, Future<dynamic> pickImage()) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              title: const Text(
                MosTexts.addCallText,
                style: MosTextStyles.boldToryBlueTextStyle,
              ),
              content: SizedBox(
                height: screenWidth / 1.3,
                child: Column(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: TextField(
                        style: TextStyle(),
                        maxLines: 7,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: ProjectPaddings.smallTopPadding,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              width: screenWidth,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all()),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      //color: Colors.red,
                                      child: Container(
                                        child: images != null
                                            ? Image.file(images!)
                                            : Container(
                                                // color: Colors.red,
                                                ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Transform.scale(
                                scale: 0.7,
                                child: FloatingActionButton(
                                    backgroundColor: MosDestekColors.toryBlue,
                                    child: const Icon(Icons.camera_alt),
                                    onPressed: () {
                                      setState(() {
                                        pickImage();
                                      });
                                    }))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: ProjectPaddings.smallTopPadding,
                        child: MosSmallButton(
                            onTap: () {},
                            screenWidth: screenWidth,
                            text: MosTexts.sendText,
                            color: MosDestekColors.toryBlue),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
