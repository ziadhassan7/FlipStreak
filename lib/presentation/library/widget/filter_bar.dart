import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../provider/filter_provider.dart';
import '../../views/dialoq/category_menu/category_menu.dart';
import '../../views/text_inria_sans.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key, required this.currentFilter});

  final String currentFilter;
  static final HiveClient _hiveClient = HiveClient();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          color: colorAccent.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),

        child: Row(
          children: [

            ///Search bar
            Expanded(
              flex: 6,
              child: TextFormField(
                style: const TextStyle(color: colorBrown),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded, color: colorAccent,),
                  border: InputBorder.none,
                  hintText: 'Search your books',
                  hintStyle: TextStyle(color: colorAccent.withOpacity(0.2)),
                ),
                onChanged: (search){
                  ref.read(filterProvider.notifier).updateCategory(search);
                },
              ),
            ),

            const Spacer(),


            /// Current Category
            InkWell(
              onTap: (){
                CategoryMenu(context, currentFilter);
              },

              child: Row(
                children: [
                  FutureBuilder(
                    future: getCategory(currentFilter),
                    builder: (context, AsyncSnapshot snapshot) {

                      return snapshot.hasData
                        ? TextInriaSans(
                        snapshot.data,
                        size: 16,
                        color: colorAccent,
                        weight: FontWeight.bold,)

                        : const Center(child: CircularProgressIndicator(),);
                    }
                  ),

                  const SizedBox(width: 10,),

                  const Icon(Icons.arrow_drop_down_rounded, color: Colors.black87,),
                ],
              ),
            ),
          ],
        ),
      ),
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