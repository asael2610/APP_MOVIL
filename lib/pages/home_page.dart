import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/network/api/url_api.dart';
import 'package:flutter_app/network/model/product_model.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/widget/card_category.dart';
import 'package:flutter_app/widget/card_product.dart';
import 'package:http/http.dart' as http;

class HomePages extends StatefulWidget {
  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<CategoryWithProduct> listCategory = [];
  getCategory() async {
    listCategory.clear();
    var urlCategory = Uri.parse(BASEURL.categoryWithProduct);
    final Response = await http.get(urlCategory);
    if (Response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(Response.body);

        for (Map item in data) {
          Map<String, dynamic> itemAsMap = Map<String, dynamic>.from(item);
          listCategory.add(CategoryWithProduct.fromJson(itemAsMap));
        }
      });
      getProduct();
    }
  }

  List<ProductModel> listProduct = [];
  getProduct() async {
    listProduct.clear();
    var urlProduct = Uri.parse(BASEURL.getProduct);
    final Response = await http.get(urlProduct);

    if (Response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(Response.body);

        for (Map product in data) {
          Map<String, dynamic> itemA = Map<String, dynamic>.from(product);
          listProduct.add(ProductModel.fromJson(itemA));
        }
      });
    }
  }

  @override
  void initState() {
    //ignorar todo
    // TODO: implement initState

    super.initState();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      padding: EdgeInsets.fromLTRB(18, 30, 24, 30),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 155,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Encuentre un Medicamento o\n Vitaminas con  MEDHEALTH",
                  style: regulerTextSyle.copyWith(
                      fontSize: 13, color: greyBoldColor),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: greenColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffe4faf0)),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffb1d8b2),
                ),
                hintText: "Buscar Medicamento...",
                hintStyle: regulerTextSyle.copyWith(color: Color(0xffb0d8b2))),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          "* PRODUCTOS FARMACEUTICOS MEDICINALES *",
          style: regulerTextSyle.copyWith(fontSize: 16),
        ),
        GridView.builder(
            itemCount: listCategory.length,
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, i) {
              final x = listCategory[i];
              return CardCategory(
                imageCategory: x.image,
                nameCategory: x.category,
              );
            }),

        /* GridView.builder(
            itemCount: listProduct.length,
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, i) {
            //  final y = listProduct[i];
            //  return CardProduct(
             //     imageProduct: y.image, nameProduct: y.name, price: y.price);
          //  }),
        // CardCategory(imageCategory, nameCategory)
      */
        //CardCategory(),
      ],
    )));
  }
}
