import 'package:flutter/material.dart';

class Drop extends StatelessWidget {
  const Drop({
    required this.letter,
    Key? key,
  }) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    bool accepted = false;
    return SizedBox(
      width: size.width * 0.15,
      height: size.height * 0.15,
      child: Center(
        child: DragTarget(onWillAccept: (data) {
          if (data == letter) {
            return true;
          } else {
            return false;
          }
        }, onAccept: (data) {
          accepted = true;
        }, builder: (context, candidateData, rejectedData) {
          if (accepted) {
            return Text(
              letter,
              style: Theme.of(context).textTheme.headline1,
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
              width: 50,
              height: 50,
            );
          }
        }),
      ),
    );
  }
}
