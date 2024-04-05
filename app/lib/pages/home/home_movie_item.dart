import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 10, color: Colors.grey.shade200)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderRanking(),
          const SizedBox(
            height: 6,
          ),
          buildContent(),
        ],
      ),
    );
  }

  //1,头部排名
  Widget buildHeaderRanking() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(4)),
      child: const Text("Rank 1"),
    );
  }

  //2，内容布局
  Widget buildContent() {
    return Row(
      children: [
        ///圆角
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Image.network(
              height: 150,
              "https://img1.baidu.com/it/u=4224688552,1670261584&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=647"),
        ),
        buildMovieInfo(),
      ],
    );
  }

  Widget buildMovieInfo() {
    return const Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("data"),
        Text(
          "asdjaj阿萨德离啦科dsdkjlasdjla阿斯蒂芬啦束带结发拉屎的技",
          maxLines: 2,
        )
      ],
    )); 
  }
}
