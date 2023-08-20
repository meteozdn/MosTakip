import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/Assets/colors.dart';
import 'package:takip_sistem_mos/components/buttons/mos_big_button.dart';

import '../../../styles/paddings.dart';

class ConfigSettings extends StatefulWidget {
  const ConfigSettings({super.key});

  @override
  State<ConfigSettings> createState() => _ConfigSettingsState();
}

class _ConfigSettingsState extends State<ConfigSettings> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController agirlikController1 = TextEditingController();
    TextEditingController agirlikController2 = TextEditingController();
    TextEditingController agirlikController3 = TextEditingController();
    TextEditingController miktarController1 = TextEditingController();
    TextEditingController miktarController2 = TextEditingController();
    TextEditingController miktarController3 = TextEditingController();
    TextEditingController task1SureController = TextEditingController();
    TextEditingController deadlineSureController = TextEditingController();

    String agirlik = "Ağırlık(%)";
    String miktar = "Miktar(tl)";
    String sure = "Süre(dk)";

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,

        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          // color: ProjectColors.tulipTree,
          child: Padding(
            padding: ProjectPaddings.mainHorizontalPadding +
                ProjectPaddings.midTopPadding / 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "Görev 1",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: MosDestekColors.toryBlue,
                                fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: ProjectPaddings.midTopPadding / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: agirlikController1,
                                decoration: InputDecoration(hintText: agirlik),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: miktarController1,
                                decoration: InputDecoration(hintText: miktar),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: ProjectPaddings.smallTopPadding,
                        child: SizedBox(
                          width: screenWidth / 2.5,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: task1SureController,
                            decoration: InputDecoration(hintText: sure),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: ProjectPaddings.midTopPadding,
                    child: MosBigButton(
                      onTap: () {},
                      screenWidth: screenWidth,
                      text: "onayla",
                      color: MosDestekColors.toryBlue,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Text(
                        "Görev 2",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: MosDestekColors.toryBlue,
                                fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: ProjectPaddings.midTopPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: agirlikController2,
                                decoration: InputDecoration(hintText: agirlik),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: miktarController2,
                                decoration: InputDecoration(hintText: miktar),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: ProjectPaddings.midTopPadding,
                    child: MosBigButton(
                      onTap: () {},
                      screenWidth: screenWidth,
                      text: "onayla",
                      color: MosDestekColors.toryBlue,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Text(
                        "Deadline",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: MosDestekColors.toryBlue,
                                fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: ProjectPaddings.midTopPadding / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: agirlikController3,
                                decoration: InputDecoration(hintText: agirlik),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: miktarController3,
                                decoration: InputDecoration(hintText: miktar),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: ProjectPaddings.smallTopPadding,
                        child: SizedBox(
                          width: screenWidth / 2.5,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: deadlineSureController,
                            decoration: InputDecoration(hintText: sure),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: ProjectPaddings.midTopPadding,
                    child: MosBigButton(
                      onTap: () {},
                      screenWidth: screenWidth,
                      text: "onayla",
                      color: MosDestekColors.toryBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> alertMethod(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Veriler Güncellendi'),
              content: const Text('Veriler Güncellendi'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Tamam'),
                  child: const Text('Tamam'),
                ),
              ],
            ));
  }

  Future<dynamic> alertMethodFalse(BuildContext context, String task) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('ALANLAR BOŞ BIRAKILAMAZ!'),
              content: Text('${task} İçin Gerekli değerleri giriniz!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Tamam'),
                  child: const Text('Tamam'),
                ),
              ],
            ));
  }
}
