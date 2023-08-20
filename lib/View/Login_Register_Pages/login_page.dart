import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/View/Admin/controller/admin_controller.dart';
import 'package:takip_sistem_mos/View/Company/controller/company_controller.dart';
import 'package:takip_sistem_mos/View/Login_Register_Pages/register_page.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../../Assets/Images/images.dart';
import '../../../Assets/colors.dart';
import 'package:takip_sistem_mos/View/Company/introduction.dart';
import 'package:takip_sistem_mos/styles/paddings.dart';
import '../../components/buttons/mos_big_button.dart';
import '../../styles/clip_path.dart';
import '../../styles/text_styles.dart';
//import '../View/Employee/introduction_employee.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: screenWidth < 400
            ? ProjectPaddings.mainHorizontalPadding +
                ProjectPaddings.midTopPadding * 2
            : ProjectPaddings.mainHorizontalPadding +
                ProjectPaddings.midTopPadding * 2,
        child: SafeArea(
          child: Container(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    //  color: Colors.red,
                    height: screenWidth / 2,

                    child: AssetImagesLogo.mosLogo1,
                  ),
                ),
                //  Text("Giriş Yap"),
                const Expanded(
                  //   flex: 2,
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: MosTexts.usernameText),
                  ),
                ),
                Expanded(
                  // flex: 2,
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: MosTexts.passwordText,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.08,
                  child: MosBigButton(
                      color: MosDestekColors.toryBlue,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CompanyController(),
                        ));
                      },
                      screenWidth: screenHeight,
                      text: MosTexts.loginText),
                ),
                Padding(
                  padding: ProjectPaddings.smallVerticalPadding * 2 +
                      ProjectPaddings.mainHorizontalPadding,
                  child: const Row(children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Divider(
                        color: MosDestekColors.toryBlue,
                        thickness: 2,
                      ),
                    )),
                    Text(MosTexts.notHaveAccountText,
                        style: MosTextStyles.defaultToryBlueTextStyle),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: MosDestekColors.toryBlue,
                        thickness: 2,
                      ),
                    )),
                  ]),
                ),
                Expanded(
                  child: Padding(
                    padding: ProjectPaddings.smallVerticalPadding,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ));
                      },
                      child: const Text(
                        MosTexts.signInText,
                        style: MosTextStyles.boldTulipTreeTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
