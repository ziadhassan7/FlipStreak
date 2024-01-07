import 'package:flutter/material.dart';

class DialogTextInput extends StatefulWidget {
  DialogTextInput({
    super.key,
    required this.labelText,
    required this.textController,
    required this.isNumericValue,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final String labelText;
  final TextEditingController textController;
  final bool isNumericValue;
  FocusNode? focusNode;
  VoidCallback? onFieldSubmitted;

  @override
  State<DialogTextInput> createState() => _DialogTextInputState();
}

class _DialogTextInputState extends State<DialogTextInput> {
  @override
  Widget build(BuildContext context) {

    //Should you show suffix button?
    bool isShowClearButton = (widget.textController.text != "");

    return TextFormField(
      ///                                                                       / settings
      focusNode: widget.focusNode,
      controller: widget.textController,
      onFieldSubmitted: (String value) {
        if(widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!();
        }
      },
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
        labelText: widget.labelText,

        ///                                                                     / suffix icon
        suffixIcon: clearIcon(
          shouldShow: isShowClearButton,

          onPressed: (){
            //clear
            widget.textController.clear();
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
