import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../dialog/edit_last_page/edit_last_page_dialoq.dart';

class EditPageNumberButton extends ConsumerWidget {
  const EditPageNumberButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(

      onTap: (){
        //open Dialog showing list of bookmarks
        EditLastPageDialog(context, ref);
      },

      child: Container(
          padding: const EdgeInsets.all(2),

          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: colorAccent,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8))
          ),

          height: 60,
          child: const Icon(Icons.mode_edit_outlined, color: colorAccent,)),
    );
  }
}
