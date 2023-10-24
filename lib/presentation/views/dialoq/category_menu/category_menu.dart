import 'package:flip_streak/data/local_db/book_client.dart';
import 'package:flutter/material.dart';
import '../../../../data/shared_pref/hive_client.dart';
import '../dialoq_widget.dart';
import 'view/category_menu_view.dart';

class CategoryMenu {

  static final TextEditingController textController = TextEditingController();
  final BookClient bookClient = BookClient.instance;
  HiveClient hiveHelper = HiveClient();

  CategoryMenu(BuildContext context, String currentCategory) {

    DialogWidget(
        context,

        disableTintColor: true,
        isDisableButtons: true,

        child: CategoryMenuView(currentCategory: currentCategory,),

    ).showStandardDialog();
  }

}

