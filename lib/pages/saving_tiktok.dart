import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_downloader/widgets/animated_text.dart';

class SavingTiktok extends StatelessWidget {
  const SavingTiktok({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: AnimatedText(text: "Saving Your Video ... ")),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/saving.gif',
                width: 130.0,
                height: 130.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
