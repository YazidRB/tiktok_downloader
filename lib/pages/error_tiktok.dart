import 'package:flutter/material.dart';

class ErrorTiktok extends StatelessWidget {
  const ErrorTiktok({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/error.png",
          width: 100,
        ),
        const SizedBox(
          height: 50,
        ),
        const Center(
          child: Text(
            "Error 404 ...\n Please Check Your Internet Conection ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "or Check Permission",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
