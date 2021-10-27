import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_app/constant/product_data.dart';
import 'package:shoes_app/pages/detail_page.dart';
import 'package:shoes_app/theme/colors.dart';
import 'package:shoes_app/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(context),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 25,
            left: 25,
            bottom: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shoes',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: const [
                  Text(
                    'Sort by',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              )
            ],
          ),
        ),
        Column(
          children: List.generate(
              products.length,
              (index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductDetailPage(
                                    id: products[index]['id'].toString(),
                                    name: products[index]['name'],
                                    img: products[index]['img'],
                                    price: products[index]['price'],
                                    mulImg: products[index]['mul_img'],
                                    sizes: products[index]['sizes'],
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          FadeInDown(
                            duration: Duration(
                              milliseconds: 450 * index
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: grey,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: black.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 2)
                                  ]),
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      width: 270,
                                      height: 170,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage("assets/images/" +
                                            products[index]['img']),
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    products[index]['name'],
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "\$ " + products[index]['price'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: IconButton(
                                  onPressed: null,
                                  icon: SvgPicture.asset(
                                      'assets/images/heart_icon.svg')))
                        ],
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
