import 'package:flutter/material.dart';
import 'package:takip_sistem_mos/styles/text_styles.dart';
import '../../Assets/colors.dart';

class ProjectListTile extends StatelessWidget {
  ProjectListTile({
    this.ontap,
    this.color,
    required this.icon,
    required this.title,
    required this.subTitle,
    super.key,
  });
  final Function()? ontap;
  final IconData icon;
  final String title;
  final String subTitle;
  Color? color = MosDestekColors.toryBlue;

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
          leading: Icon(
            icon,
            color: color,
            size: 35,
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
