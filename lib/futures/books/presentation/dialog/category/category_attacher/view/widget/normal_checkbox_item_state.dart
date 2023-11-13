import 'package:flip_streak/futures/books/presentation/managers/state_manager/category_save_button_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../../core/constants/color_constants.dart';
import '../../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../../data/model/book_model.dart';
import '../../category_attacher_dialog.dart';

class NormalCheckboxItemState extends ConsumerStatefulWidget {
  const NormalCheckboxItemState(
      {Key? key,
        required this.catTitle,
        required this.currentBook,
        required this.updateState,
      })
      : super(key: key);

  final String catTitle;
  final BookModel currentBook;
  final Function() updateState;

  @override
  ConsumerState<NormalCheckboxItemState> createState() => _NormalCheckboxItemStateState();
}

class _NormalCheckboxItemStateState extends ConsumerState<NormalCheckboxItemState> {
  static bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder(
            future: CategoryAttacherDialog.getBookCategories(widget.currentBook),
            builder: (context, AsyncSnapshot snapshot) {


              if (snapshot.hasData){
                //list all manu categories
                List categories = snapshot.data!;
                //check if book has this label
                isChecked = categories.contains(widget.catTitle);
                //show checkbox with current status
                return customCheckbox(ref);

              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            }
        ),

        TextView(widget.catTitle),

        const Spacer(),

        IconButton(
            onPressed: () {
              widget.updateState();
            },
            icon: const Icon(Icons.edit_rounded, color: Colors.black, size: 18,)
        )
      ],
    );
  }

  Widget customCheckbox(WidgetRef ref){

    //Inside a dialog, checkboxes do not work correctly
    //You need to wrap them in a statefulBuilder
    return StatefulBuilder(
      builder: (context, setState) {

        return Checkbox(
            activeColor: colorAccent,
            value: isChecked,
            onChanged: (newValue){

              setState((){
                isChecked = newValue!; //using newValue caused problems
              });

              newValue!
                  ? CategoryAttacherDialog.currentCategories.add(widget.catTitle)
                  : CategoryAttacherDialog.currentCategories.remove(widget.catTitle);

              //show save button
              ref.read(categorySaveButtonProvider.notifier).showSaveButton();
            }
        );
      }
    );
  }

}
