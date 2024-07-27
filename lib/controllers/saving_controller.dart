
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<int> animation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = IntTween(
      begin: 0,
      end: 100,
    ).animate(animationController);

    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  String getStringFronInt(int length, String word) {
    return word.substring(0, (length / 100 * word.length).round());
  }
}
