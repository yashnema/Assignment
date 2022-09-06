import 'package:assignment/constants.dart';
import 'package:assignment/modal/perform.dart';
import 'package:assignment/utility.dart';
import 'package:flutter/material.dart';

class Performances extends StatelessWidget {
  final List<Performance> list;
  const Performances({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance',
          style: kHeadingTextStyle(),
        ),
        underLine(context),
        ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(
                    width: 70.0,
                    child: Text(
                      '${list[index].label}',
                      style: kNormalTextStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  SizedBox(
                    width: 150.0,
                    child: LinearProgressIndicator(
                      value: list[index].changePercent!.abs() /
                          list.last.changePercent!.abs(),
                      minHeight: 12.0,
                      color: list[index].changePercent! < 0
                          ? Colors.red
                          : const Color.fromARGB(255, 17, 120, 21),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        list[index].changePercent! < 0
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: list[index].changePercent! < 0
                            ? Colors.red
                            : const Color.fromARGB(255, 17, 120, 21),
                      ),
                      Text(list[index].changePercent!.abs().toStringAsFixed(1)),
                    ],
                  )
                ],
              );
            })
      ],
    );
  }
}
