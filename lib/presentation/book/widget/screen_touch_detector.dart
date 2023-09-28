import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/top_bar_provider.dart';

class ScreenTouchDetector extends StatelessWidget {
  const ScreenTouchDetector({Key? key, required this.widgetRef}) : super(key: key);

  final WidgetRef widgetRef;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,

      onTap: () {
        widgetRef.read(topbarProvider.notifier).toggle();
      },

      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
