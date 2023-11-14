import 'package:flutter/material.dart';

class PageDialogView extends StatefulWidget {
  const PageDialogView(
      {super.key,
      required this.label,
      required this.controller,
      required this.isNumericValue});

  final String label;
  final TextEditingController controller;
  final bool isNumericValue;

  @override
  State<PageDialogView> createState() => _PageDialogViewState();
}

class _PageDialogViewState extends State<PageDialogView> {

  @override
  Widget build(BuildContext context) {

    //Should you show suffix button?
    bool isShowClearButton = (widget.controller.text != "");

    return TextFormField(
      ///                                                                       / settings
      controller: widget.controller,
      keyboardType: widget.isNumericValue? TextInputType.number : null,
      ///                                                                       / Listen to text change
      onChanged: (text) {
        setState((){
          isShowClearButton = (text != "");
        });
      },
      //settings
      textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
        ///                                                                     / label
        labelText: widget.label,

        ///                                                                     / suffix icon
        suffixIcon: clearIcon(
            shouldShow: isShowClearButton,

            onPressed: (){
              //clear
              widget.controller.clear();
              //update
              setState((){
                isShowClearButton = false;
              });
            },
        ),

      ),);
  }

  Widget? clearIcon({
    required Function() onPressed,
    required bool shouldShow,
  }){
    if(shouldShow){
      return IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.clear),
      );
    }

    return null;
  }
}
