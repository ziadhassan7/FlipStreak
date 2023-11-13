import 'package:flutter/material.dart';
import '../widget/edit_checkbox_item_state.dart';
import '../widget/normal_checkbox_item_state.dart';

class AttacherCategoryMenuItem extends StatefulWidget {
  const AttacherCategoryMenuItem(
      this.itemTitle,
      this.itemIndex,
      {Key? key,
        required this.currentCategory,
        required this.isFirstWidget,
        required this.paddingInBetween,}) : super(key: key);

  final String itemTitle;
  final int itemIndex;
  final String currentCategory;
  final bool isFirstWidget;
  final double paddingInBetween;

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
        currentCategory: widget.currentCategory,
    )

      : NormalCheckboxItemState(
        widget.itemTitle,
        currentCategory: widget.currentCategory,
        isFirstWidget: widget.isFirstWidget,
        paddingInBetween: widget.paddingInBetween,
        updateState: toggleState,
    );
  }


  void toggleState() {
    setState(() {
      isEditingState = !isEditingState;
    });
  }
}
