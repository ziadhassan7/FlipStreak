import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/styles/box_decoration.dart';
import '../../../../../../../core/styles/padding.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../managers/controllers/book_controller.dart';
import '../../../../managers/state_manager/scroll_page_indicator_provider.dart';
import '../../../../managers/state_manager/scroll_view_provider.dart';

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

              return TextView("${bookModel.lastPage}/${getTotalPages()}");
            }
          ),
        ),
      ),
    );
  }
}
