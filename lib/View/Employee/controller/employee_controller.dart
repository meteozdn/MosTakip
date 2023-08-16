import 'package:flutter/material.dart';
import '../../../../Assets/colors.dart';
import 'package:takip_sistem_mos/View/Employee/employeeAllTasks.dart';
import 'package:takip_sistem_mos/View/Employee/employeeMyTasks.dart';
import 'package:takip_sistem_mos/components/paddings.dart';
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
                  text: "Tüm Çağrılar",
                ),
                Tab(
                  text: "Çağrılarım",
                ),
              ],
            ),
          ),
          appBar: AppBar(
            actions: [
              Padding(
                padding: ProjectPaddings.mainHorizontalPadding,
                child: TextButton(
                  child: Text(
                    "Tamamladıklarım",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
          body: const TabBarView(children: [
            EmployeeAllTasksPage(),
            EmployeeMyTasksPage(),
          ]),
        ));
  }
}
