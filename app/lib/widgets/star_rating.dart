import 'package:flutter/material.dart';

//评分  比例 星级
class WZStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unSelectedColor;
  final Color selectedColor;

  const WZStarRating({
    super.key,
    this.rating = 6.8,
    this.maxRating = 10.0,
    this.count = 5,
    this.size = 30.0,
    this.unSelectedColor = Colors.grey,
    this.selectedColor = Colors.yellow,
  });

  @override
  State<WZStarRating> createState() => _WZStarRatingState();
}

class _WZStarRatingState extends State<WZStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          ///默认row横向布局尽可能大，调整尽可能包裹，尽可能小
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStars(),
        ),
        Row(
          ///默认row横向布局尽可能大，调整尽可能包裹，尽可能小
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStars(),
        )
      ],
    );
  }

  List<Widget> buildUnselectedStars() {
    return List.generate(widget.count, (index) {
      return Icon(
        Icons.star_border,
        color: widget.unSelectedColor,
        size: widget.size,
      );
    });
  }

  List<Widget> buildSelectedStars() {
    List<Widget> starts = [];
    Icon selectedIcon = Icon(
      Icons.star,
      color: widget.selectedColor,
      size: widget.size,
    );

//  构建满的star
    double oneValue = widget.maxRating / widget.count;

    ///向下取整
    int entireCount = (widget.rating / oneValue).floor();

    for (int i = 0; i < entireCount; i++) {
      starts.add(selectedIcon);
    }
//  构建不足一个的star
    double leftWidth = (widget.rating / oneValue - entireCount) * widget.size;
    final halfStar = ClipRect(
      child: selectedIcon,
      clipper: WZStarClipper(leftWidth),
    );
    starts.add(halfStar);

    if (starts.length > widget.count) {
      return starts.sublist(0, widget.count);
    }

    return starts;
  }
}

class WZStarClipper extends CustomClipper<Rect> {
  final double wid;

  WZStarClipper(
    this.wid,
  );

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, wid, size.height);
  }

  ///什么时候需要（重新）裁剪
  @override
  bool shouldReclip(WZStarClipper oldClipper) {
    return oldClipper.wid != wid;
  }
}
