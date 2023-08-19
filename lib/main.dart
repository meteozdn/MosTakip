import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/View/Admin/controller/admin_controller.dart';
import 'package:takip_sistem_mos/View/Company/controller/company_controller.dart';
import 'package:takip_sistem_mos/View/Employee/controller/employee_controller.dart';
import 'package:takip_sistem_mos/View/Employee/employeeAllTasks.dart';
import 'package:takip_sistem_mos/View/Login_Register_Pages/login_page.dart';
import 'package:takip_sistem_mos/View/Login_Register_Pages/register_page.dart';
import '../Assets/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const LoginPage(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: MosDestekColors.toryBlue,
              titleTextStyle: TextStyle(
                  color: MosDestekColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
            elevation: MaterialStateProperty.all(8),
            backgroundColor:
                MaterialStateProperty.all(MosDestekColors.toryBlue),
          )),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            filled: true, //<-- SEE HERE
            fillColor: MosDestekColors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black), //<-- SEE HERE
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: MosDestekColors.toryBlue), //<-- SEE HERE
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ));
  }
}
