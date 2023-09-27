import 'package:flip_streak/business/app_wise/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../provider/book_list_provider.dart';
import '../../../views/circular_button.dart';
import '../../../views/dialoq/category_attacher/category_attacher_dialog.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),

      child: Consumer(
          builder: (context, ref, _) {

            ref.watch(bookListProvider);

            return SizedBox(
              height: size,
              width: size,
              child: CircularButton(
                  onTap: () {
                    CategoryAttacherDialog(context, ref, currentBook: bookModel);
                  },
                  color: colorAccent,
                  icon: const Icon(Icons.category_outlined, color: Colors.white,)
              ),
            );
          }
      ),
    );
  }
}
