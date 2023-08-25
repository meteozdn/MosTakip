import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import '../../Assets/Images/images.dart';
import '../../Assets/colors.dart';

class ImageListTile extends StatelessWidget {
  ImageListTile({
    this.color,
    this.trailingIcon,
    this.ontap,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    this.isCircularAvatar = false,
    super.key,
  });
  final Function()? ontap;
  final String imagePath;
  final String title;
  final String subTitle;
  bool isCircularAvatar;
  Color? color = MosDestekColors.toryBlue;
  IconData? trailingIcon;

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
          leading: isCircularAvatar
              ? CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imagePath),
                )
              : SizedBox(
                  width: 50, height: 50, child: Image.network(imagePath)),
          title: Text(
            title,
            style: MosTextStyles.midToryBlueTextStyle,
          ),
          subtitle: Text(
            subTitle,
          ),
          trailing: Icon(
            trailingIcon,
            color: color,
            size: 35,
          ),
          //  trailing: const Icon(Icons.add),
        ),
      ),
    );
  }
}
