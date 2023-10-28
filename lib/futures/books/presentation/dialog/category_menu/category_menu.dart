import 'package:flutter/material.dart';
import '../../../../../../core/shared_pref/hive_client.dart';
import '../../../../app_common_views/dialoq_widget.dart';
import '../../../data/local_db/book_client.dart';
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

