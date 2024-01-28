import 'package:flutter/material.dart';
import 'package:rexar_shop/utils/tools/assistants.dart';

class AppSnackBar extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  const AppSnackBar(
      {required this.text, required this.icon, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: color)),
      width: width(context) * 0.95,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              icon,
              width: width(context) * 0.3,
            ),
            Container(
              height: height(context) * 0.05,
              width: 1,
              color: color,
            ),
            Text(
              text,
              maxLines: 5,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
