import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/app_wise/add_book_util.dart';
import '../../../data/shared_pref/hive_client.dart';

class AddBookFab extends ConsumerWidget {
  const AddBookFab({super.key, required this.currentFilter});

  final String currentFilter;
  static final HiveClient _hiveClient = HiveClient();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.small(
      onPressed: () async => AddBookUtil.addBook(ref, currentCategory: await getCategory(currentFilter)),

      backgroundColor: const Color.fromRGBO(255, 242, 233, 1.0), //Color.fromRGBO(255, 231, 220, 1.0),
      child: const Icon(Icons.add, color: colorBrown,),
    );
  }


  Future<String> getCategory(String category) async {
    List categories = await _hiveClient.getCategories();

    for(String item in categories){
      if(category == item){
        return category;
      }
    }

    return "All";
  }
}
