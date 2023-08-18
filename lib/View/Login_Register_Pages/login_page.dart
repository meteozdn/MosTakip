import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/View/Admin/controller/admin_controller.dart';
import 'package:takip_sistem_mos/components/texts/text.dart';
import '../../../Assets/Images/images.dart';
import '../../../Assets/colors.dart';
import 'package:takip_sistem_mos/View/Company/introduction.dart';
import 'package:takip_sistem_mos/components/styles/paddings.dart';
import '../../components/buttons/mos_big_button.dart';
import '../../components/styles/clip_path.dart';
import '../../components/styles/text_styles.dart';
//import '../View/Employee/introduction_employee.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              width: screenWidth,
              //   color: MosDestekColors.azure,
            ),
          ),
          Padding(
            padding: screenWidth < 400
                ? ProjectPaddings.mainHorizontalPadding +
                    ProjectPaddings.midTopPadding * 3
                : ProjectPaddings.mainHorizontalPadding +
                    ProjectPaddings.midTopPadding * 5,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment,
              children: [
                SizedBox(
                  //  color: Colors.red,
                  height: screenWidth / 2,

                  child: AssetImagesLogo.mosLogo1,
                ),
                //  Text("Giriş Yap"),
                Padding(
                  padding: ProjectPaddings.midTopPadding * 2,
                  child: const TextField(
                    decoration:
                        InputDecoration(hintText: MosTexts.usernameText),
                  ),
                ),
                const Padding(
                  padding: ProjectPaddings.midTopPadding,
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: MosTexts.passwordText),
                  ),
                ),
                Padding(
                  padding: ProjectPaddings.midTopPadding,
                  child: MosBigButton(
                      color: MosDestekColors.toryBlue,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const IntroductionPage(),
                        ));
                      },
                      screenWidth: screenWidth,
                      text: MosTexts.loginText),
                ),
                Padding(
                  padding: ProjectPaddings.midTopPadding +
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
                Padding(
                  padding: ProjectPaddings.midTopPadding / 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminController(),
                      ));
                    },
                    child: const Text(
                      MosTexts.signInText,
                      style: MosTextStyles.boldTulipTreeTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
