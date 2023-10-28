import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../managers/state_manager/categories_provider.dart';


class AddItemButton extends ConsumerStatefulWidget {
  const AddItemButton({Key? key, required this.paddingInBetween}) : super(key: key);

  final double paddingInBetween;

  @override
  ConsumerState<AddItemButton> createState() => _AddNewItemState();
}

class _AddNewItemState extends ConsumerState<AddItemButton> {
  final TextEditingController addItemTextController = TextEditingController();
  static bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.paddingInBetween),
          child:
          isActive
            ? customIconButton(
              Icons.close,
              onPressed: (){
                setState(() => doneEditing());
              })
            : customIconButton(Icons.add)
        ),

        Expanded(
          child: FocusScope(
            child: Focus(
              onFocusChange: (isFocused) {
                setState(() {
                  isActive = isFocused;
                });
              },

              child: TextFormField(
                controller: addItemTextController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Create new label',
                    hintStyle: TextStyle(color: Colors.black38)
                ),

                onFieldSubmitted: (value) {
                  addInput(ref);
                },
              ),
            ),
          ),
        ),


        Visibility(
          visible: isActive,

          child: customIconButton(
            Icons.done_rounded,
            onPressed: () {
              addInput(ref);
            }
          ),
        )
      ],
    );
  }


  Widget customIconButton(IconData icon, {Function()? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Icon(icon, color: Colors.black38,));
  }

  void doneEditing() {
    isActive = false;
    FocusScope.of(context).unfocus();
    addItemTextController.clear();
  }

  void addInput(WidgetRef ref) {
    ref.read(categoriesProvider.notifier)
        .addCategoryItem(addItemTextController.text.trim());
    setState(() => doneEditing());
  }
}
