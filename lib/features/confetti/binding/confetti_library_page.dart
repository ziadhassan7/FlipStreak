import 'package:flip_streak/features/confetti/custom_confetti_widget.dart';
import 'package:flip_streak/features/confetti/state_manager/confetti_library_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfettiLibraryPage extends ConsumerWidget {
  const ConfettiLibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isPlaying = ref.watch(confettiLibraryProvider);

    return CustomConfetti(
        shouldStart: isPlaying,

        strong: true,
        direction: ConfettiDirection.explosive,
    );
  }
}
