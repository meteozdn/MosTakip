import 'package:flutter/material.dart';
import '../../../Assets/Images/images.dart';
import '../../../Assets/colors.dart';

import 'package:takip_sistem_mos/components/paddings.dart';

class RequestAddPage extends StatelessWidget {
  const RequestAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //  const double pi = 3.1415926535897932;

    // double screenHeight = MediaQuery.of(context).size.height;
//!colorlara ekle1!!!!!!
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(47, 60, 72, 1),
        title: const Text(
          "Çağrı Talebi Oluşturun",
        ),
      ),
      backgroundColor: MosDestekColors.white,
      body: Column(
        // alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: ProjectPaddings.mainHorizontalPadding +
                ProjectPaddings.midTopPadding,
            child: SizedBox(
                height: screenWidth / 4, child: AssetImagesLogo.kalyonLogo),
          ),
          Padding(
            padding: ProjectPaddings.mainHorizontalPadding +
                ProjectPaddings.midTopPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: MosDestekColors.toryBlue,
                  borderRadius: BorderRadius.circular(40)),
              //color: Colors.black12,
              height: screenWidth,
              child: Padding(
                padding: ProjectPaddings.mainHorizontalPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Destek Talebinin İçeriğini Girin:',
                            fillColor: MosDestekColors.white),
                        keyboardType: TextInputType.multiline,
                        maxLines: 10),
                    Padding(
                        padding: ProjectPaddings.midTopPadding,
                        child: OutlinedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          ),
                          child: const Padding(
                            padding: ProjectPaddings.smallMainPdding,
                            child: Text(
                              "Gönder",
                              style: TextStyle(color: MosDestekColors.toryBlue),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
