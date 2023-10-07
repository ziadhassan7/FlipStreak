import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNoteFab extends ConsumerWidget {
  const AddNoteFab({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.small(
      onPressed: () {},

      backgroundColor: const Color.fromRGBO(255, 225, 217, 1.0), //Color.fromRGBO(255, 231, 220, 1.0),
      child: const Icon(Icons.add, color: colorBrown,),
    );
  }
}
