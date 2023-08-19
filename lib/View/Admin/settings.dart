import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../../../Assets/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
// late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    File? images;
    const String title = "Ayarlar";
    //double screenWidth = MediaQuery.of(context).size.width;
    //   double screenHeight = MediaQuery.of(context).size.height;
    Future pickImage() async {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => images = imageTemporary);
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: const BottomAppBar(
            //  surfaceTintColor: Colors.amber,
            color: MosDestekColors.toryBlue,
            child: TabBar(
              tabs: [
                Tab(
                  text: MosTexts.generalText,
                ),
                Tab(
                  text: MosTexts.usersText,
                )
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: false,
            title: const Text(title),
          ),
          body: const TabBarView(children: []),
        ));
  }
}
