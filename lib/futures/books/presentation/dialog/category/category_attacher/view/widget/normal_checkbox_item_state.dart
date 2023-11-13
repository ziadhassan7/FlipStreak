import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../../core/constants/color_constants.dart';
import '../../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../managers/state_manager/filter_provider.dart';

class NormalCheckboxItemState extends ConsumerWidget {
  const NormalCheckboxItemState(
      this.itemTitle,
      {Key? key,
        required this.currentCategory,
        required this.isFirstWidget,
        required this.paddingInBetween,
        required this.updateState
      }) : super(key: key);

  final String itemTitle;
  final String currentCategory;
  final bool isFirstWidget;
  final double paddingInBetween;
  final Function() updateState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCurrent = (currentCategory == itemTitle);

    /// OnTap
    return InkWell(
      onTap: (){
        ref.read(filterProvider.notifier)
            .updateCategory(itemTitle);
        Navigator.pop(context);
      },

      /// Decoration - if selected
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: isCurrent
                  ? BoxDecoration(
                  color: colorAccent.withOpacity(0.05),
                  borderRadius: const BorderRadius.all(Radius.circular(30))
              )
              : null,

              child: Row(
                children: [
                  /// Icon - if current category
                  isCurrent
                      ? Padding(
                        padding: EdgeInsets.only(left: 10, right: paddingInBetween),
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: colorAccent.withOpacity(0.1),
                                borderRadius: const BorderRadius.all(Radius.circular(50))
                            ),
                            child: const Icon(Icons.done, color: colorAccent,)),
                      )
                      : SizedBox(width: 25+paddingInBetween,),


                  /// Text/Title
                  Expanded(
                      flex: 3,
                      child: TextView(itemTitle, weight: FontWeight.bold, )),
                ],
              ),
            ),
          ),

          const Spacer(),

          /// Edit button, unless it's first widget
          isFirstWidget
              ? const SizedBox(height: 45,)
              : IconButton(
              onPressed: () {
                updateState();
              },
              icon: const Icon(Icons.edit_rounded, color: Colors.black, size: 18,)
          )
        ],
      ),
    );
  }
}
