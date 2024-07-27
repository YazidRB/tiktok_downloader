import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Define the tween sequence
    animation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(-0.2, -0.2),
          end: const Offset(0.2, 0.2),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.2, 0.2),
          end: const Offset(0.2, -0.2),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.2, -0.2),
          end: const Offset(-0.2, 0.2),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
    ]).animate(animationController);

    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
