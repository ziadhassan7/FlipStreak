import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/books/presentation/dialog/category_menu/view/widget/add_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../managers/state_manager/categories_provider.dart';
import 'category_menu_item.dart';

class CategoryMenuView extends StatelessWidget {
  const CategoryMenuView({Key? key, required this.currentCategory}) : super(key: key);

  final String currentCategory;
  static const double _paddingInBetween = 20;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height *0.7,
      width: MediaQuery.of(context).size.width *0.8,

      child: Column(
        children: [

          /// Dialog Title
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: TextView("Categories", color: colorAccent, size: 30,),
          ),

          /// Add new menu item -  Button
          const AddItemButton(paddingInBetween: _paddingInBetween),

          /// Menu List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),

              child: Consumer(
                builder: (context, ref, _) {
                  final categoriesList = ref.watch(categoriesProvider).reversed.toList();

                  return ListView.separated(
                    itemCount: categoriesList.length +1,
                    itemBuilder: (context, index){

                      return categoriesList.isEmpty
                          //Empty list should show just, "All"
                          ? CategoryMenuItem(
                              "All",
                              index-1,
                              currentCategory: "All",
                              isFirstWidget: true,
                              paddingInBetween: _paddingInBetween,)


                          //First item should be "All"
                          : index == 0
                            ? CategoryMenuItem(
                                "All",
                                index-1,
                                currentCategory: currentCategory,
                                isFirstWidget: true,
                                paddingInBetween: _paddingInBetween,)

                            : CategoryMenuItem(
                                categoriesList[index-1].toString(),
                                flipIndex(index, categoriesList.length),
                                currentCategory: currentCategory,
                                isFirstWidget: false,
                                paddingInBetween: _paddingInBetween,);
                    },

                    separatorBuilder: (BuildContext context, int index)
                          => const Divider(color: Colors.black12,) ,);
                }
              ),
            ),
          ),
        ],
      ),
    );
  }

  //list is inverted so you need to flip the index
  int flipIndex(int index, int length){
    //[0,1,2,3,4]
    //[4,3,2,1,0]
    return length - index;
  }
}
