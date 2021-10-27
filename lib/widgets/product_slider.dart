import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoes_app/theme/colors.dart';

class ProductSlider extends StatefulWidget {
  final List<dynamic> items;

  const ProductSlider(this.items, {Key? key}) : super(key: key);

  @override
  _ProductSliderState createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int activeIndex = 0;

  void onPageChanged(int index, CarouselPageChangedReason r) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 315,
          child: CarouselSlider(
            items: widget.items
                .map((e) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage('assets/images/' + e),
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: onPageChanged,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                widget.items.length,
                (index) => activeIndex == index
                    ? const ActiveDot()
                    : const InactiveDot()),
          ),
        )
      ],
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        width: 20,
        height: 8,
        decoration: BoxDecoration(
            color: black, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        width: 13,
        height: 8,
        decoration: BoxDecoration(
            color: black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
