import 'package:flutter/material.dart';
import '../Assets/colors.dart';

class MosTextStyles {
  static const defaultToryBlueTextStyle =
      TextStyle(color: MosDestekColors.toryBlue);

  static const boldToryBlueTextStyle =
      TextStyle(color: MosDestekColors.toryBlue, fontWeight: FontWeight.bold);

  static const midToryBlueTextStyle =
      TextStyle(color: MosDestekColors.toryBlue, fontSize: 25);

  static const boldWhiteTextStyle = TextStyle(
      color: MosDestekColors.white, fontSize: 20, fontWeight: FontWeight.bold);

  static const defaultWhiteTextStyle =
      TextStyle(color: MosDestekColors.white, fontWeight: FontWeight.bold);

  static const boldTulipTreeTextStyle =
      TextStyle(color: MosDestekColors.tulipTree, fontWeight: FontWeight.bold);

  static const mosTulipTreeTitle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: MosDestekColors.tulipTree);

  static const mosMediumHeadline = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: MosDestekColors.toryBlue);
}
