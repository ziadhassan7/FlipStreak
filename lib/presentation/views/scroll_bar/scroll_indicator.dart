import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/scroll_page_indicator_provider.dart';
import '../../../provider/scroll_view_provider.dart';
import '../../styles/box_decoration.dart';
import '../../styles/device_screen.dart';

class ScrollIndicator extends ConsumerWidget {
  const ScrollIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onPanDown: (det){
        ref.read(scrollPageIndicatorProvider.notifier).show();
      },

      onPanUpdate: (det){
        ref.read(scrollViewProvider.notifier)
            .update(det.globalPosition.dy, DeviceScreen(context).height);
      },

      onPanEnd: (det){
        ref.read(scrollPageIndicatorProvider.notifier).hide();
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
