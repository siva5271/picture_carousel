import 'package:carousel_slider/carousel_slider.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class pictureCarouselScreen extends StatefulWidget {
  final List<String> imagesUrl;
  pictureCarouselScreen({required this.imagesUrl});

  @override
  State<pictureCarouselScreen> createState() => _pictureCarouselScreenState();
}

class _pictureCarouselScreenState extends State<pictureCarouselScreen> {
  int activeIndex = 0;
  @override
  void initState() {
    FBroadcast.instance().register('Key_Message', (value, callback) {
      var data = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FBroadcast.instance().broadcast(
      "Key_Message",
      value: 'Hi',
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picture Carousel"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider.builder(
                itemCount: widget.imagesUrl.length,
                itemBuilder: ((context, index, realIndex) {
                  final urlImage = widget.imagesUrl[index];
                  return Image.network(
                    urlImage,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  );
                }),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  enableInfiniteScroll: true,
                )),
            const SizedBox(
              height: 20,
            ),
            AnimatedSmoothIndicator(
                activeIndex: activeIndex, count: widget.imagesUrl.length)
          ],
        ),
      ),
    );
  }
}
