import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../provider/current_category_provider.dart';
import '../../views/dialoq/category_menu/category_menu.dart';
import '../../views/text_inria_sans.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCategory = ref.watch(currentCategoryProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: InkWell(
        onTap: (){
          CategoryMenu(context, currentCategory);
        },

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          decoration: BoxDecoration(
            color: colorAccent.withOpacity(0.04),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),

          child: Row(
            children: [
              TextInriaSans("Category:", size: 16, color: Colors.black38,),

              const Spacer(),

              TextInriaSans(
                currentCategory,
                size: 16,
                color: colorAccent,
                weight: FontWeight.bold,),

              const SizedBox(width: 10,),

              const Icon(Icons.arrow_drop_down_rounded, color: Colors.black87,),
            ],
          ),
        ),
      ),
    );
  }
}
