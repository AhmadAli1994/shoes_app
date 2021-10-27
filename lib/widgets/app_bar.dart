import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/pages/cart_page.dart';
import 'package:shoes_app/pages/menu_page.dart';
import 'package:shoes_app/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar getAppBar(context) {
  return AppBar(
    backgroundColor: white,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MenuPage()));
            },
            icon: SvgPicture.asset("assets/images/burger_icon.svg")),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/images/search_icon.svg")),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/images/filter_icon.svg")),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => CartPage()));
                },
                icon: Container(
                  decoration: const BoxDecoration(
                    color: black,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ))
          ],
        )
      ],
    ),
  );
}
