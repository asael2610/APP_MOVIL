import "package:flutter/material.dart";
import "package:flutter_app/pages/register_pagina.dart";
import "package:flutter_app/widget/button_primary.dart";
import "package:flutter_app/widget/general_logo_space.dart";
import "package:flutter_app/widget/widget_ilustration.dart";

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GeneralLogoSpace(
            child: Column(
      children: [
        SizedBox(
          height: 45,
        ),
        WidgetIlustration(
          image: "assets/splash_ilustration.png",
          title: "APLICACION DE DESARROLLO DE RECETAS MEDICAS",
          subtitle1: "Desarrollo WEB",
          subtitle2: "Ingenieria en Sistemas UMG",
          child: ButtonPrimary(
            text: "GET STARTED",
            onTap: () {},
          ),
        ),
      ],
    )));
  }
}
