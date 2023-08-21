import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import '../../Assets/Images/images.dart';
import '../../Assets/colors.dart';

class ImageListTile extends StatelessWidget {
  ImageListTile({
    this.ontap,
    required this.icon,
    required this.title,
    required this.subTitle,
    super.key,
  });
  final Function()? ontap;
  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        shadowColor: Colors.black,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AssetIllustraions.creative,
          ),
          title: Text(
            title,
            style: MosTextStyles.midToryBlueTextStyle,
          ),
          subtitle: Text(
            subTitle,
          ),
          //  trailing: const Icon(Icons.add),
        ),
      ),
    );
  }
}
