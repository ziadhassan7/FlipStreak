import 'package:flip_streak/provider/scroll_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../provider/scroll_page_indicator_provider.dart';
import '../../styles/box_decoration.dart';
import '../../styles/padding.dart';
import '../text_inria_sans.dart';

class ScrollPagesIndicator extends ConsumerWidget {
  const ScrollPagesIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Visibility(
      visible: ref.watch(scrollPagesIndicatorProvider),

      child: Material(
        elevation: 1,

        child: Container(
          padding: const CustomPadding(horizontal: 15, vertical: 10),
          decoration: CustomDecoration(
              backgroundColor: Colors.white,
              radius: 30
          ),

          child: Consumer(
            builder: (context, ref, _) {
              ref.watch(scrollViewPositionProvider);

              return TextInriaSans("${bookModel.lastPage}/${getTotalPages()}");
            }
          ),
        ),
      ),
    );
  }
}
