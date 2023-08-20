import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takip_sistem_mos/View/Admin/controller/settings.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../../../Assets/colors.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';
import '../../../components/buttons/mos_small_button.dart';
import '../../../styles/text_styles.dart';
import '../calisanlar.dart';
import '../musteriler.dart';

class AdminController extends StatefulWidget {
  const AdminController({super.key});

  @override
  State<AdminController> createState() => _AdminControllerState();
}

class _AdminControllerState extends State<AdminController> {
// late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    File? images;
    const String title = "Panel";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Future pickImage() async {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => images = imageTemporary);
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: MosDestekColors.toryBlue,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        title: const Text(
                          MosTexts.addCallText,
                          style: MosTextStyles.boldToryBlueTextStyle,
                        ),
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
                                              child:
                                                  const Icon(Icons.camera_alt),
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
            },
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: const BottomAppBar(
            //  surfaceTintColor: Colors.amber,
            color: MosDestekColors.toryBlue,
            child: TabBar(
              tabs: [
                Tab(
                  text: MosTexts.costumerText,
                ),
                Tab(
                  text: MosTexts.employeeText,
                )
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: false,
            title: const Text(title),
            actions: [
              Padding(
                  padding: ProjectPaddings.mainHorizontalPadding,
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ));
                    },
                  ))
            ],
          ),
          body:
              const TabBarView(children: [MusterilerPage(), CalisanlarPage()]),
        ));
  }
}
