import 'package:flutter/material.dart';

class AnimationDemoPage extends StatefulWidget {
  static String routeName = "/AnimationDemoPage";
  const AnimationDemoPage({super.key});

  @override
  State<AnimationDemoPage> createState() => _AnimationDemoPageState();
}

class _AnimationDemoPageState extends State<AnimationDemoPage>
    with SingleTickerProviderStateMixin {
  //late 显式声明一个非空的变量，但不初始化   /    延迟初始化变量（类似 swift lazy）
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
    // controller.addListener(() {
    //   setState(() {});
    // });
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    // 4.控制动画的翻转
    controller.addStatusListener((status) {
      debugPrint("addStatusListener  $status");
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("动画 demo"),
          backgroundColor: Colors.green,
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey,
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (ctx, child) {
                      return Transform.scale(
                        scale: controller.value,
                        child: child,
                      );
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 100,
                    ),
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (!controller.isAnimating) {
              controller.forward();
            } else {
              controller.stop();
            }
          },
          child: const Icon(Icons.animation),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
