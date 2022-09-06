import 'package:assignment/constants.dart';
import 'package:flutter/material.dart';

SizedBox underLine(BuildContext context) {
  return SizedBox(
    height: 10.0,
    width: (MediaQuery.of(context).size.width / 2),
    child: const Divider(
      color: Colors.grey,
    ),
  );
}

class OverviewData extends StatelessWidget {
  OverviewData(
      {Key? key, required this.leftText, required this.rightText, this.icon})
      : super(key: key);
  final String leftText;
  final String rightText;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: kNormalTextStyle(),
          ),
          Row(
            children: [
              Icon(
                icon,
                size: 15,
                color: const Color.fromARGB(255, 199, 138, 5),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                rightText,
                style: kNormalTextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
