import 'package:flutter/material.dart';
import '../widget/edit_item_state.dart';
import '../widget/normal_item_state.dart';


class CategoryMenuItem extends StatefulWidget {
  const CategoryMenuItem(
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
  State<CategoryMenuItem> createState() => _CategoryMenuItemState();
}

class _CategoryMenuItemState extends State<CategoryMenuItem> {

  bool isEditingState = false;

  @override
  Widget build(BuildContext context) {


    return isEditingState
            ? EditItemState(
                widget.itemTitle,
                widget.itemIndex,
                updateState: toggleState,
                currentCategory: widget.currentCategory,
              )

            : NormalItemState(
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
