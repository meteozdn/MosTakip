import 'dart:io';

import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../../../../Assets/colors.dart';
import '../settings/config_settings.dart';
import '../settings/user_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
// late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    const String title = "Ayarlar";
    //double screenWidth = MediaQuery.of(context).size.width;
    //   double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            //  surfaceTintColor: Colors.amber,
            color: MosDestekColors.toryBlue,
            child: TabBar(
              tabs: [
                Tab(
                  text: Tabs.Calisanlar.name,
                ),
                const Tab(
                  text: MosTexts.usersText,
                )
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: false,
            title: const Text(title),
          ),
          body: const TabBarView(children: [ConfigSettings(), UserSettings()]),
        ));
  }
}

enum Tabs { Calisanlar, Musteriler }
