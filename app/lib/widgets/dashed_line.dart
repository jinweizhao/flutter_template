import 'package:flutter/material.dart';

// 虚线
class WZDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  const WZDashedLine({
    super.key,
    this.axis = Axis.horizontal,
    this.dashedWidth = 8,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_) {
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(decoration: BoxDecoration(color: color)),
        );
      }),
    );
  }
}
