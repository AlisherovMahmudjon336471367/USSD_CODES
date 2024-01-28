import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TarifInfoWidget extends StatelessWidget {
  String title;
  String subtitle;
  bool isTarif;
  TarifInfoWidget(
      {this.isTarif = true,
      required this.title,
      required this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: isTarif ? 10 : 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          Text(
            subtitle,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: isTarif ? 16 : 12),
          ),
        ],
      ),
    );
  }
}
