import 'package:flip_streak/features/confetti/custom_confetti_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_manager/confetti_lamp_provider.dart';

class ConfettiLampPage extends ConsumerWidget {
  const ConfettiLampPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isPlaying = ref.watch(confettiLampProvider);

    return CustomConfetti(
        shouldStart: isPlaying,
        direction: ConfettiDirection.down,
    );
  }
}
