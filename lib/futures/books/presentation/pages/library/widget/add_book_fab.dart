import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/shared_pref/hive_client.dart';
import '../../../managers/controllers/helpers/add_book_util.dart';

class AddBookFab extends ConsumerWidget {
  const AddBookFab({super.key, required this.currentFilter});

  final String currentFilter;
  static final HiveClient _hiveClient = HiveClient();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.small(
      heroTag: "btn1",
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
