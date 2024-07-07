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
  late PageController _pageController;
  double _pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _initializePageController();
  }

  void _initializePageController() {
    final viewportFraction = (widget.height ?? 300) * 0.7 / 300;
    _pageController = PageController(viewportFraction: viewportFraction);
    _pageController.addListener(() {
      if (mounted) {
        setState(() {
          _pageOffset = _pageController.page!;
        });
      }
    });
  }

  void _disposePageController() {
    _pageController.dispose();
  }

  @override
  void didUpdateWidget(covariant ParallaxSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.height != widget.height) {
      _disposePageController();
      _initializePageController();
    }
  }

  @override
  void dispose() {
    _disposePageController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 300,
      width: double.infinity,
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
                          width: widget.height,
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
