import 'package:flutter/material.dart';
import '../../../../../../../../core/constants/color_constants.dart';
import '../../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../../data/model/book_model.dart';
import '../../category_attacher_dialog.dart';

class NormalCheckboxItemState extends StatefulWidget {
  const NormalCheckboxItemState(
      {Key? key,
        required this.catTitle,
        required this.currentBook,
        required this.updateState,
        required this.updateSaveButtonState,
      })
      : super(key: key);

  final String catTitle;
  final BookModel currentBook;
  final Function() updateState;
  final Function() updateSaveButtonState;

  @override
  State<NormalCheckboxItemState> createState() => _NormalCheckboxItemStateState();
}

class _NormalCheckboxItemStateState extends State<NormalCheckboxItemState> {
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
                return customCheckbox();

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

  Widget customCheckbox(){

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
              widget.updateSaveButtonState();
            }
        );
      }
    );
  }

}
