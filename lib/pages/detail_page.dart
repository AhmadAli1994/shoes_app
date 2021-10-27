import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_app/theme/colors.dart';
import 'package:shoes_app/widgets/product_slider.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String img;
  final String price;
  final List mulImg;
  final List sizes;

  const ProductDetailPage({
    Key? key,
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.mulImg,
    required this.sizes,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSizes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2)
                  ]),
              child: Stack(
                children: [
                  ProductSlider(widget.mulImg),
                  SafeArea(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert)),
                    ],
                  ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 450),
            child: const Image(
              image: AssetImage("assets/images/nike_logo.png"),
              width: 80,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            child: Text(
              widget.name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 550),
            child: Text(
              '\$ ' + widget.price,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: FadeInDown(
              duration: const Duration(milliseconds: 600),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Size",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Size Guide",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: FadeInDown(
              duration: const Duration(milliseconds: 650),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      widget.sizes.length,
                      (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                activeSizes = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: activeSizes == index ? black : grey,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 2)
                                    ]),
                                child: Center(
                                  child: Text(
                                    widget.sizes[index],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: activeSizes == index
                                            ? white
                                            : black),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: FadeInDown(
              duration: const Duration(milliseconds: 700),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.keyboard_arrow_up)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 25),
            child: FadeInDown(
              duration: const Duration(milliseconds: 750),
              child: Row(
                children: [
                  Container(
                    color: grey,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 2)
                          ]),
                      child: Center(
                        child: SvgPicture.asset("assets/images/heart_icon.svg"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: black,
                        onPressed: () {},
                        child: const SizedBox(
                          height: 70,
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
