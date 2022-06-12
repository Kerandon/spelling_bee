import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class Drag extends StatefulWidget {
  const Drag({
    required this.letter,
    Key? key,
  }) : super(key: key);

  final String letter;

  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Selector<Controller, bool>(
      selector: (_, controller) => controller.generateWord,
      builder: (_, generate, __) {
        if (generate) {
          _accepted = false;
        }
        return SizedBox(
          width: size.width * 0.15,
          height: size.height * 0.15,
          child: Center(
            child: _accepted
                ? const SizedBox()
                : Draggable(
                    data: widget.letter,
                    onDragEnd: (details) {
                      if (details.wasAccepted) {
                        _accepted = true;
                        setState(() {});
                        Provider.of<Controller>(context, listen: false)
                            .incrementLetters(context: context);
                      }
                    },
                    childWhenDragging: const SizedBox(),
                    feedback: Text(
                      widget.letter,
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                        shadows: [
                          Shadow(
                              offset: const Offset(3, 3),
                              color: Colors.black.withOpacity(0.40),
                              blurRadius: 5)
                        ],
                      ),
                    ),
                    child: Text(
                      widget.letter,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
