import 'package:flip_streak/features/confetti/custom_confetti_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_manager/confetto_details_provider.dart';

class ConfettiDetailsPage extends ConsumerWidget {
  const ConfettiDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isPlaying = ref.watch(confettiDetailsProvider);

    return CustomConfetti(
        shouldStart: isPlaying,

        strong: true,
        direction: ConfettiDirection.explosive,
    );
  }
}
