import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double begin = 0, end = 0;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    _animation = Tween<double>(begin: begin, end: end).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<Controller, double>(
      selector: (_, controller) => controller.percentCompleted,
      builder: (_, percent, __) {
        end = percent;
        if (!_controller.isAnimating) {
          _animation = Tween<double>(begin: begin, end: end).animate(
              CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
          _controller.reset();
          _controller.forward();
          begin = end;
          if (begin == 1) {
            begin = 0;
            end = 0;
          }
        }
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: LinearProgressIndicator(
                color: Colors.amber,
                backgroundColor: Colors.grey,
                value: _animation.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
