import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/scroll_page_indicator_provider.dart';
import '../../../provider/scroll_view_provider.dart';
import '../../styles/box_decoration.dart';

class ScrollIcon extends ConsumerWidget {
  const ScrollIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onPanDown: (det){
        ref.read(scrollPagesIndicatorProvider.notifier).show();
      },

      onPanUpdate: (det){
        ref.read(scrollViewPositionProvider.notifier)
            .updateWithPosition(context, det.globalPosition.dy);
      },

      onPanEnd: (det){
        ref.read(scrollPagesIndicatorProvider.notifier).hide();
      },

      child: Container(
        decoration: CustomDecoration(
            backgroundColor: Colors.black26,
            radius: 30),

        height: 40, width: 21,
      ),
    );
  }
}
