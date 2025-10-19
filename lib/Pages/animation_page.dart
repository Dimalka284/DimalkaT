import 'dart:async';
import 'package:flutter/material.dart';

class HeroImageSlider extends StatefulWidget {
  const HeroImageSlider({super.key});

  @override
  State<HeroImageSlider> createState() => _HeroImageSliderState();
}

class _HeroImageSliderState extends State<HeroImageSlider> {
  // Two images (hero banners)
  final List<String> images = ['assets/profilepic.png', 'assets/mainimage.png'];

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Change image every 4 seconds
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // stop timer when widget destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final slideAnimation = Tween<Offset>(
              begin: const Offset(0, 0), // slide in from right
              end: Offset.zero,
            ).animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: slideAnimation, child: child),
            );
          }, // fade speed
          child: Image.asset(
            images[_currentIndex],
            key: ValueKey<String>(
              images[_currentIndex],
            ), // important for switching
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
        ),
      ),
    );
  }
}
