import 'package:flutter/material.dart';

class ParallaxSlider extends StatefulWidget {
  const ParallaxSlider({
    required this.imageType,
    required this.imagePaths,
    super.key,
    this.height,
    this.spaceBetweenItems,
    this.borderRadius,
  });

  final double? height;
  final double? spaceBetweenItems;
  final BorderRadius? borderRadius;
  final ParallaxSliderImageType imageType;
  final List<String> imagePaths;

  @override
  State<ParallaxSlider> createState() => _ParallaxSliderState();
}

class _ParallaxSliderState extends State<ParallaxSlider> {
  late final PageController _pageController;
  double _pageOffset = 0;

  @override
  void initState() {
    super.initState();
    final viewportFraction =
        widget.height ?? 300 / MediaQuery.sizeOf(context).width;
    _pageController = PageController(viewportFraction: viewportFraction);
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 300,
      child: PageView.builder(
          itemCount: widget.imagePaths.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return Transform.scale(
              scale: 1,
              child: Container(
                padding: EdgeInsets.only(
                  right: index != widget.imagePaths.length - 1
                      ? widget.spaceBetweenItems ?? 20
                      : 0,
                ),
                child: ClipRRect(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(15),
                  child: widget.imageType == ParallaxSliderImageType.NETWORK
                      ? Image.network(
                          widget.imagePaths[index],
                          fit: BoxFit.cover,
                          alignment: Alignment(-_pageOffset.abs() + index, 0),
                        )
                      : Image.asset(
                          widget.imagePaths[index],
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

enum ParallaxSliderImageType { ASSETS, NETWORK }
