import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_downloader/controllers/saving_controller.dart';

class AnimatedText extends StatelessWidget {
  AnimatedText({super.key, required this.text});

  final SavingController controller = Get.find();
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animation,
      builder: (context, child) => Text(
        controller.getStringFronInt(controller.animation.value, text),
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600,
          letterSpacing: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
