import 'package:flutter/material.dart';
import 'package:flutter_app/pages/splash_screen.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/widget/button_primary.dart';
import 'package:flutter_app/widget/general_logo_space.dart';
import 'package:flutter_app/widget/widget_ilustration.dart';

class HistoryPages extends StatefulWidget {
  const HistoryPages({super.key});

  @override
  State<HistoryPages> createState() => _HistoryPagesState();
}

class _HistoryPagesState extends State<HistoryPages> {
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
          image: "assets/usuario.png",
          title: "USER11",
          subtitle1: "USER11@GMAIL.COM",
          subtitle2: "12345678",
          child: Text("APP CLINICA MEDICA MEDHEALT"),
        ),
        SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen()),
                (route) => false);
          },
          child: Text("SALIR DE APP",
              style: regulerTextSyle.copyWith(fontSize: 18, color: greenColor)),
        ),
      ],
    )));
  }
}
