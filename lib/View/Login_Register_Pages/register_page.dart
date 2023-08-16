import 'package:flutter/material.dart';
import '../../../Assets/Images/images.dart';
import '../../../Assets/colors.dart';
import 'package:takip_sistem_mos/components/paddings.dart';

import '../../components/buttons/mos_big_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    String loginText = "Giriş Yapın";
    String usernameText = "Kullanıcı Adı";
    String passwordText = "Şifre";
    String alreadyHaveAccountText = "Hesabınız Var Mı?";
    String signInText = "Kayıt Ol";

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MosDestekColors.toryBlue,
        body: Stack(alignment: Alignment.center, children: [
          //  Container(color: Colors.blue)
          Container(
            decoration: const BoxDecoration(
                /*
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.center,
                colors: <Color>[
                  MosDestekColors.azure,
                  // MosDestekColors.summerSky,
                  MosDestekColors.summerSky,
                  //  MosDestekColors.cerulean
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                //  tileMode: TileMode.mirror,
              ),
              */
                ),
          ),
          /*
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              width: screenWidth,
              color: MosDestekColors.paleTurquoise,
            ),
          ),
          */
          Padding(
            padding: screenWidth < 400
                ? ProjectPaddings.mainHorizontalPadding +
                    ProjectPaddings.midTopPadding * 1.5
                : ProjectPaddings.mainHorizontalPadding +
                    ProjectPaddings.midTopPadding * 5,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment,
              children: [
                SizedBox(
                  //  color: Colors.red,
                  height: screenWidth / 3,
                  width: screenWidth / 3,
                  child: AssetImagesLogo.mosLogo,
                ),
                //  Text("Giriş Yap"),
                Padding(
                  padding: ProjectPaddings.midTopPadding * 2,
                  child: TextField(
                    decoration: InputDecoration(hintText: usernameText),
                  ),
                ),
                Padding(
                  padding: ProjectPaddings.midTopPadding,
                  child: TextField(
                    decoration: InputDecoration(hintText: usernameText),
                  ),
                ),
                Padding(
                  padding: ProjectPaddings.midTopPadding,
                  child: TextField(
                    decoration: InputDecoration(hintText: passwordText),
                  ),
                ),
                Padding(
                  padding: ProjectPaddings.midTopPadding,
                  child: MosBigButton(
                      color: MosDestekColors.toryBlue,
                      onTap: () {},
                      screenWidth: screenWidth,
                      text: signInText),
                ),
                Padding(
                  padding: ProjectPaddings.midTopPadding / 2 +
                      ProjectPaddings.mainHorizontalPadding,
                  child: Row(children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Divider(
                        thickness: 2,
                      ),
                    )),
                    Text(alreadyHaveAccountText),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        thickness: 2,
                      ),
                    )),
                  ]),
                ),
                Padding(
                  padding: ProjectPaddings.midTopPadding / 2,
                  child: Text(
                    loginText,
                    style: const TextStyle(
                        //    color: MosDestekColors.cyprus,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: screenWidth < 400
                      ? ProjectPaddings.mainHorizontalPadding +
                          ProjectPaddings.midTopPadding * 0.5
                      : ProjectPaddings.mainHorizontalPadding +
                          ProjectPaddings.midTopPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SquareButton(
                        icon: Icons.mail,
                        screenWidth: screenWidth,
                        onTap: () {},
                      ),
                      SquareButton(
                        icon: Icons.phone,
                        screenWidth: screenWidth,
                        onTap: () {},
                      ),
                      SquareButton(
                        icon: Icons.ads_click_outlined,
                        screenWidth: screenWidth,
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}

class SquareButton extends StatelessWidget {
  const SquareButton({
    super.key,
    required this.screenWidth,
    required this.onTap,
    required this.icon,
  });
  final Function() onTap;
  final double screenWidth;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //     color: MosDestekColors.cyprus,
        ),

        width: screenWidth / 7,
        height: screenWidth / 7,
//        color: MosDestekColors.cyprus,
        child: Icon(
          icon,
          size: 35,
          //      color: MosDestekColors.azure,
        ),
      ),
    );
  }
}
