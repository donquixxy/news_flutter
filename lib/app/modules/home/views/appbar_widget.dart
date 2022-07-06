import 'package:flutter/cupertino.dart';
import 'package:news_flutter/app/modules/home/views/carousel_slider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Flutter News",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        CarouselSliderWidget(),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Latest News",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
