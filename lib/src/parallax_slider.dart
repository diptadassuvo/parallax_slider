import 'package:flutter/material.dart';

List<String> demoData = [
  "https://img.freepik.com/free-photo/beautiful-mountains-landscape_23-2150787826.jpg",
  "https://img.freepik.com/free-photo/abstract-colorful-background_23-2150787824.jpg",
  "https://img.freepik.com/free-photo/beautiful-mountains-landscape_23-2150787826.jpg",
  "https://img.freepik.com/free-photo/abstract-colorful-background_23-2150787824.jpg",
  "https://img.freepik.com/free-photo/beautiful-mountains-landscape_23-2150787826.jpg",
  "https://img.freepik.com/free-photo/abstract-colorful-background_23-2150787824.jpg",
];

class ParallaxSlider extends StatefulWidget {
  const ParallaxSlider({super.key});

  @override
  State<ParallaxSlider> createState() => _ParallaxSliderState();
}

class _ParallaxSliderState extends State<ParallaxSlider> {
  late final PageController _pageController;
  double _pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
          itemCount: demoData.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return Transform.scale(
              scale: 1,
              child: Container(
                padding: EdgeInsets.only(
                  right: index != demoData.length - 1 ? 20 : 0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    demoData[index],
                    height: 370,
                    fit: BoxFit.cover,
                    alignment: Alignment(-_pageOffset.abs() + index, 0),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
