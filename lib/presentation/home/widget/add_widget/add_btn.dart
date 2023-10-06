import 'package:flip_streak/business/app_wise/add_book_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../data/model/book_model.dart';
import '../../../views/circular_button.dart';

class AddIconButton extends StatelessWidget {
  AddIconButton({Key? key}) : super(key: key);

  late BookModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {

          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),

              child: CircularButton(
                onTap: () => AddBookUtil.addBook(ref),
                color: const Color.fromRGBO(242, 193, 162, 1), // Button color
                icon: const Icon(Icons.add, color: colorDark,),
              )
          );
        }
    );
  }

}
