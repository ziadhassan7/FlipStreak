import 'package:flutter/material.dart';
import '../../../../../data/model/book_model.dart';
import 'widget/edit_checkbox_item_state.dart';
import 'widget/normal_checkbox_item_state.dart';

class AttacherCategoryMenuItem extends StatefulWidget {
  const AttacherCategoryMenuItem(
      this.itemTitle,
      this.itemIndex,
      {Key? key, required this.currentBook,}) : super(key: key);

  final String itemTitle;
  final int itemIndex;
  final BookModel currentBook;

  @override
  State<AttacherCategoryMenuItem> createState() => _AttacherCategoryMenuItemState();
}

class _AttacherCategoryMenuItemState extends State<AttacherCategoryMenuItem> {

  bool isEditingState = false;

  @override
  Widget build(BuildContext context) {


    return isEditingState
      ? EditCheckboxItemState(
        widget.itemTitle,
        widget.itemIndex,
        updateState: toggleState,
      )

      : NormalCheckboxItemState(
        catTitle: widget.itemTitle,
        currentBook: widget.currentBook,
        updateState: toggleState,
      );
  }


  void toggleState() {
    setState(() {
      isEditingState = !isEditingState;
    });
  }
}
