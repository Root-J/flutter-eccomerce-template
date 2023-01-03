import 'dart:async';

import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Slideshow extends StatefulWidget {
  const Slideshow({
    Key? key,
    required this.children,
    this.width = double.infinity,
    this.height = 200,
    this.initialPage = 0,
    this.indicatorColor,
    this.indicatorBackgroundColor = Colors.grey,
    this.onPageChanged,
    this.autoPlayInterval,
    this.isLoop = false,
    this.indicatorRadius = 3,
  }) : super(key: key);

  /// The widgets to display in the [Slideshow].
  ///
  /// Mainly intended for image widget, but other widgets can also be used.
  final List<Widget> children;

  /// Width of the [Slideshow].
  final double width;

  /// Height of the [Slideshow].
  final double height;

  /// The page to show when first creating the [Slideshow].
  final int initialPage;

  /// The color to paint the indicator.
  final Color? indicatorColor;

  /// The color to paint behind th indicator.
  final Color? indicatorBackgroundColor;

  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int>? onPageChanged;

  /// Auto scroll interval.
  ///
  /// Do not auto scroll when you enter null or 0.
  final int? autoPlayInterval;

  /// Loops back to first slide.
  final bool isLoop;

  /// Radius of CircleIndicator.
  final double indicatorRadius;

  @override
  SlideshowState createState() => SlideshowState();
}

class SlideshowState extends State<Slideshow> {
  late final ValueNotifier<int> _currentPageNotifier;
  late final PageController _pageController;
  Timer? _timer;

  void _onPageChanged(int index) {
    _currentPageNotifier.value = index;
    if (widget.onPageChanged != null) {
      final correctIndex = index % widget.children.length;
      widget.onPageChanged!(correctIndex);
    }
  }

  void _autoPlayTimerStart() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: widget.autoPlayInterval!),
      (timer) {
        int nextPage;
        if (widget.isLoop) {
          nextPage = _currentPageNotifier.value + 1;
        } else {
          if (_currentPageNotifier.value < widget.children.length - 1) {
            nextPage = _currentPageNotifier.value + 1;
          } else {
            return;
          }
        }

        goToPage(nextPage);
      },
    );
  }

  void goToPage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initialPage,
    );

    _currentPageNotifier = ValueNotifier(widget.initialPage);

    if (widget.autoPlayInterval != null && widget.autoPlayInterval != 0) {
      _autoPlayTimerStart();
    }
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height + AppSize.s16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.height,
            child: PageView.builder(
              scrollBehavior: const ScrollBehavior().copyWith(
                scrollbars: false,
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              onPageChanged: _onPageChanged,
              itemCount: widget.isLoop ? null : widget.children.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                final correctIndex = index % widget.children.length;
                return widget.children[correctIndex];
              },
            ),
          ),
          SizedBox(
            height: AppSize.s16,
            child: Center(
              child: ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, value, child) {
                  return Indicator(
                    count: widget.children.length,
                    currentIndex: value % widget.children.length,
                    activeColor: widget.indicatorColor,
                    backgroundColor: widget.indicatorBackgroundColor,
                    radius: widget.indicatorRadius,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.count,
    required this.currentIndex,
    this.activeColor,
    this.backgroundColor,
    required this.radius,
  }) : super(key: key);

  final int count;
  final int currentIndex;
  final Color? activeColor;
  final Color? backgroundColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      alignment: WrapAlignment.center,
      children: List.generate(
        count,
        (index) {
          return CircleAvatar(
            radius: radius,
            backgroundColor:
                currentIndex == index ? activeColor : backgroundColor,
          );
        },
      ),
    );
  }
}
