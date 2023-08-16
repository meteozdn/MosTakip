import 'package:flutter/material.dart';
import '../../Assets/colors.dart';

class ProjectListTile extends StatelessWidget {
  ProjectListTile({
    this.ontap,
    required this.icon,
    super.key,
  });
  final Function()? ontap;
  final IconData icon;
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
            color: MosDestekColors.toryBlue,
          ),
          title: const Text(
            'Title',
            style: TextStyle(
              fontSize: 20,
              color: MosDestekColors.toryBlue,
            ),
          ),
          subtitle: const Text(
            'Sub Title',
          ),
          //  trailing: const Icon(Icons.add),
        ),
      ),
    );
  }
}
