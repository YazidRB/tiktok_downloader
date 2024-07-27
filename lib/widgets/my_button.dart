import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.icon,
  });
  final void Function()? onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: Colors.grey.shade900, // Sophisticated background color
        textColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 40.0), // Padding
        elevation: 8.0, // Subtle shadow
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 3, // Spacing between letters for elegance
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              icon,
            )
          ],
        ));
  }
}
