import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Assets/colors.dart';
import 'package:takip_sistem_mos/components/paddings.dart';

import '../../../components/buttons/mos_small_button.dart';
import '../../../components/cards/list_tile.dart';
import '../../../components/cards/tamamlanan_card.dart';
//import 'package:expansion_tile_card/expansion_tile_card.dart';

//import '../../components/clip_path.dart';

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

    Future pickImage() async {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => images = imageTemporary);
    }

    @override
    //  const double pi = 3.1415926535897932;
        List topCards = const [
      TamamlananCard(
        color: MosDestekColors.aliceBlue,
      ),
      TamamlananCard(
        color: MosDestekColors.aliceBlue,
      ),
      TamamlananCard(
        color: MosDestekColors.aliceBlue,
      ),
    ];
    // double screenHeight = MediaQuery.of(context).size.height;
    return
        //  backgroundColor: MosDestekColors.white,

        Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: MosDestekColors.toryBlue,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          title: const Text('Talep oluşturun'),
                          content: SizedBox(
                            height: screenWidth / 1.3,
                            child: Column(
                              children: [
                                const Expanded(
                                  flex: 3,
                                  child: TextField(
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
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all()),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  //color: Colors.red,
                                                  child: images != null
                                                      ? Image.file(images!)
                                                      : Container(
                                                          //  color: Colors.red,
                                                          ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Transform.scale(
                                            scale: 0.7,
                                            child: FloatingActionButton(
                                                backgroundColor:
                                                    MosDestekColors.toryBlue,
                                                child: const Icon(
                                                    Icons.camera_alt),
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
                                        text: "Gönder",
                                        color: MosDestekColors.toryBlue),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
              },
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              backgroundColor: MosDestekColors.toryBlue,
              title: const Text(
                "Çağrı Talebi Oluşturun",
              ),
            ),
            backgroundColor: MosDestekColors.white,
            body: Column(
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
                  child: const Divider(
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: ProjectPaddings.mainHorizontalPadding +
                      ProjectPaddings.smallVerticalPadding,
                  child: Text(
                    "Bekleyenler",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Expanded(
                  flex: screenHeight < 670 ? 7 : 4,
                  child: Padding(
                    padding: ProjectPaddings.mainHorizontalPadding,
                    child: SizedBox(
                      //  height: screenHeight * 0.7,
                      child: ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return ProjectListTile(icon: Icons.timer);
                          }),
                    ),
                  ),
                ),
              ],
            ));
  }
}
