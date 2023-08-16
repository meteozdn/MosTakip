import 'package:flutter/material.dart';
import '../../../Assets/Images/images.dart';
import '../../../Assets/colors.dart';
import 'package:takip_sistem_mos/View/Company/introduction.dart';
import 'package:takip_sistem_mos/components/paddings.dart';
import '../../components/buttons/mos_big_button.dart';
import '../../components/clip_path.dart';
//import '../View/Employee/introduction_employee.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    String loginText = "Giriş Yap";
    String usernameText = "Kullanıcı Adı";
    String passwordText = "Şifre";
    String notHaveAccountText = "Hesabınız Yok Mu?";
    String signInText = "Kayıt Olun";

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(alignment: Alignment.center, children: [
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const IntroductionPage(),
                        ));
                      },
                      screenWidth: screenWidth,
                      text: loginText),
                ),
                Padding(
                  padding: ProjectPaddings.midTopPadding +
                      ProjectPaddings.mainHorizontalPadding,
                  child: Row(children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Divider(
                        color: MosDestekColors.toryBlue,
                        thickness: 2,
                      ),
                    )),
                    Text(
                      notHaveAccountText,
                      style: const TextStyle(
                        color: MosDestekColors.toryBlue,
                      ),
                    ),
                    const Expanded(
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
                  child: Text(
                    signInText,
                    style: const TextStyle(
                        color: MosDestekColors.tulipTree,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
