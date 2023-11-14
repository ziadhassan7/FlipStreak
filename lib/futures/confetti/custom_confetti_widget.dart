import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConfettiDirection{
  up,
  down,
  left,
  right,
  explosive
}

class CustomConfetti extends ConsumerStatefulWidget {
  const CustomConfetti(
      {super.key,
      this.strong = false,
      required this.direction,
      required this.shouldStart});

  final bool strong;
  final ConfettiDirection direction;
  final bool shouldStart;

  @override
  ConsumerState<CustomConfetti> createState() => _ConfettiState();
}

class _ConfettiState extends ConsumerState<CustomConfetti> {

  late ConfettiController controller;

  // initialize confettiController
  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(milliseconds: 300));
  }

  // dispose the controller
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    checkConfettiState(ref);

    return ConfettiWidget(
      confettiController: controller,
      blastDirectionality: getDirectionalityType(),
      blastDirection: getDirection(),
      maxBlastForce: widget.strong? 10: 5,
      minBlastForce: 1,
      emissionFrequency: 0.03,
      numberOfParticles: widget.strong? 40 : 5, // particles
      shouldLoop:false,
      gravity: 0.1, //how fast it falls

      colors: const [
        colorAccent,
        colorOrange,
        colorGreyedLook,
        Colors.blue,
        Colors.yellow,
      ],
    );
  }

  checkConfettiState(WidgetRef ref){

    if(widget.shouldStart){
      controller.play();

    } else {
      controller.stop();
    }
  }

  double getDirection(){

    switch(widget.direction){
      case ConfettiDirection.up:
        return -pi / 2;
      case ConfettiDirection.down:
        return pi / 2;
      case ConfettiDirection.left:
        return pi / 2;
      case ConfettiDirection.right:
        return 0;

      case ConfettiDirection.explosive:
        return 0;
    }
  }

  BlastDirectionality getDirectionalityType(){

    if(widget.direction == ConfettiDirection.explosive){
      return BlastDirectionality.explosive;

    } else {
      return BlastDirectionality.directional;
    }
  }
}
