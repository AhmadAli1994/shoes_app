import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:shoes_app/constant/product_data.dart';
import 'package:shoes_app/theme/colors.dart';
import 'package:shoes_app/widgets/app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 20),
          child: Text(
            'My Bag',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
          child: Column(
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: FadeInDown(
                  duration: Duration(
                    milliseconds: 450 * index
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4)
                            ]),
                        width: 140,
                        height: 80,
                        child: Center(
                          child: Image(
                            image: AssetImage(
                              'assets/images/' + products[index]['img'],
                            ),
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index]['name'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ " + products[index]['price'],
                                  style: const TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w400),
                                ),
                                const Text(
                                  "x1",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '\$ 500.00',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: black,
              onPressed: () {},
              child: const SizedBox(
                height: 70,
                child: Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
