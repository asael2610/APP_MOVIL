import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/register_pagina.dart';
import 'package:flutter_app/theme.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function onTap;
  ButtonPrimary({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterPages()));
          //LoginPages()
          //RegisterPages()
        },
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: greenColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
