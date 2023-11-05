import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';

class CardCategory extends StatelessWidget {
  final String imageCategory = "";
  final String nameCategory = "";
  CardCategory({imageCategory, nameCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/img_vitamins.png",
          width: 65,
        ),
        Text(
          "Vitamina",
          style: regulerTextSyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          "TEXOFIL",
          style: boldTextSyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
