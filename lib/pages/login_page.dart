import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/main_page.dart';
import 'package:flutter_app/network/api/url_api.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/widget/button_primary.dart';
import 'package:flutter_app/widget/general_logo_space.dart';
import 'package:http/http.dart' as http;

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  submitLogin() async {
    var urlLogin = Uri.parse(BASEURL.apiLogin);
    final response = await http.post(urlLogin, body: {
      "email": emailController.text,
      "password": passwordController.text
    });

    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];

    if (value == 1) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Information"),
                content: Text(message),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPages()),
                            (route) => false);
                      },
                      child: Text("OK"))
                ],
              ));
      setState(() {});
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: GeneralLogoSpace(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
                ),
                Text(
                  "--INGRESO DE USUARIO--",
                  style: regulerTextSyle.copyWith(fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Registrar Una Cuenta Nueva",
                  style: regulerTextSyle.copyWith(
                      fontSize: 15, color: greyLightColor),
                ),
                SizedBox(
                  height: 50,
                ),

                //TEXTO Y CREACION DE correo
                Container(
                  padding: EdgeInsets.only(left: 16),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            spreadRadius: 0),
                      ],
                      color: whiteColor),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'CORREO ELECTRONICO',
                        hintStyle: lightTextSyle.copyWith(
                            fontSize: 15, color: greyLightColor)),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                //TEXTO Y CONTRASEÑA
                Container(
                  padding: EdgeInsets.only(left: 16),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            spreadRadius: 0),
                      ],
                      color: whiteColor),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: passwordController,
                    obscureText: _secureText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: showHide,
                          icon: _secureText
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 20,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 20,
                                ),
                        ),
                        border: InputBorder.none,
                        hintText: 'CONTRASEÑA',
                        hintStyle: lightTextSyle.copyWith(
                            fontSize: 15, color: greyLightColor)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ButtonPrimary(
                    text: "INGRESO",
                    onTap: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("WARNING !!"),
                                  content: Text("Porfavor, presionar enter"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"))
                                  ],
                                ));
                      } else {
                        submitLogin();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ",
                      style: lightTextSyle.copyWith(
                          color: greyLightColor, fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPages()),
                            (route) => false);
                      },
                      child: Text(
                        " Regresar a Registro ? ",
                        style: boldTextSyle.copyWith(
                            color: greenColor, fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            )),
            padding: EdgeInsets.all(1),
          )
        ],
      ),
    );
  }
}
