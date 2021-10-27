import 'package:flutter/material.dart';
import 'package:shoes_app/pages/home_page.dart';
import 'package:shoes_app/theme/colors.dart';
import 'package:animate_do/animate_do.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List menuItems = ['Home', 'New in', 'Sale', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: black,
              ))),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                menuItems.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => HomePage()),
                                (route) => false);
                          },
                          child: ElasticIn(
                            duration: Duration(
                              milliseconds: 600 * index
                            ),
                            child: Text(
                              menuItems[index],
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w600),
                            ),
                          )),
                    )),
          ),
        )
      ],
    );
  }
}
