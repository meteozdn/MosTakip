import 'package:flutter/material.dart';

import '../../../../Assets/colors.dart';

import 'package:takip_sistem_mos/components/paddings.dart';

import '../calisanlar.dart';
import '../musteriler.dart';
//import 'package:expansion_tile_card/expansion_tile_card.dart';

//import '../../components/clip_path.dart';

class AdminController extends StatefulWidget {
  const AdminController({super.key});

  @override
  State<AdminController> createState() => _AdminControllerState();
}

class _AdminControllerState extends State<AdminController> {
// late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: const BottomAppBar(
            //  surfaceTintColor: Colors.amber,
            color: MosDestekColors.toryBlue,
            child: TabBar(
              tabs: [
                Tab(
                  text: "Müşteriler",
                ),
                Tab(
                  text: "Çalışanlar",
                )
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: false,
            title: Text("Panel"),
            actions: const [
              Padding(
                  padding: ProjectPaddings.mainHorizontalPadding,
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ))
            ],
          ),
          body:
              const TabBarView(children: [MusterilerPage(), CalisanlarPage()]),
        ));
  }
}
