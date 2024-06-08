import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late List<Animation<Offset>> slideAnimationList;
  int length = 5;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    slideAnimationList = List.generate(
        length,
        (index) => Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(CurvedAnimation(
                parent: animationController,
                curve: Interval(index * (1 / length), 1))));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: slideAnimationList[index],
            child: ListTile(
              title: Text('Hello World, Taha. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationController.isCompleted) {
            animationController.reverse();
            return;
          }
          animationController.forward();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
