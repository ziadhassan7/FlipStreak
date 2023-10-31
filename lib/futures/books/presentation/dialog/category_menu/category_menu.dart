import 'package:flutter/material.dart';
import '../../../../../../core/shared_pref/hive_client.dart';
import '../../../../app_common_views/z_dialog/z_dialog.dart';
import '../../../data/local_db/book_client.dart';
import 'view/category_menu_view.dart';

class CategoryMenu {

  static final TextEditingController textController = TextEditingController();
  final BookClient bookClient = BookClient.instance;
  HiveClient hiveHelper = HiveClient();

  CategoryMenu(BuildContext context, String currentCategory) {

    ZDialog(
        context,

        disableTintColor: true,
        isDisableButtons: true,

        child: CategoryMenuView(currentCategory: currentCategory,),

    ).showStandardDialog();
  }

}

