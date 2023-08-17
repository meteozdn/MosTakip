import 'package:flutter/material.dart';
import '../../../../Assets/colors.dart';
import 'package:takip_sistem_mos/View/Employee/employeeAllTasks.dart';
import 'package:takip_sistem_mos/View/Employee/employeeMyTasks.dart';

import '../../../components/texts/text.dart';
//import 'package:expansion_tile_card/expansion_tile_card.dart';

//import '../../components/clip_path.dart';

class EmployeeController extends StatefulWidget {
  const EmployeeController({super.key});

  @override
  State<EmployeeController> createState() => _EmployeeControllerState();
}

class _EmployeeControllerState extends State<EmployeeController> {
  // late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: const BottomAppBar(
            color: MosDestekColors.toryBlue,
            child: TabBar(
              tabs: [
                Tab(
                  text: MosTexts.allCall,
                ),
                Tab(
                  text: MosTexts.myCall,
                ),
              ],
            ),
          ),
          appBar: AppBar(),
          body: const TabBarView(children: [
            EmployeeAllTasksPage(),
            EmployeeMyTasksPage(),
          ]),
        ));
  }
}
