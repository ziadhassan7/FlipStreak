import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../../data/model/book_model.dart';
import '../../../managers/state_manager/book_list_provider.dart';
import '../views/last_book_widget.dart';
import '../widget/add_widget/add_widget.dart';
import '../views/book_list_view.dart';
import '../widget/streak_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final list = ref.watch(bookListProvider);

    return Scaffold(
      backgroundColor: colorPrimary,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Top Section
              const SizedBox(
                height: 350,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    /// Streak
                    Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: StreakWidget()),

                    /// Add Button
                    AddWidget(),
                  ],
                ),
              ),

              /// Last Book
              const LastBookWidget(),

              /// List - Book List
              FutureBuilder(
                  future: list,
                  builder: (context, AsyncSnapshot snapshot) {

                    if(snapshot.hasData) {

                      List currentlyReading = getCurrentList(snapshot.data);

                      if(currentlyReading.isEmpty){
                        return Container(
                            padding: const EdgeInsets.only(top: 150),
                            alignment: AlignmentDirectional.bottomCenter,
                            child: TextView("You haven't read anything yet! :)",
                              weight: FontWeight.bold, color: Colors.brown.shade400, size: 16,));

                      } else {

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical:20, horizontal: 34),
                              child: TextView("Recently Read", size: 18, weight: FontWeight.bold,),
                            ),

                            BookListView(list: currentlyReading),
                          ],
                        );
                      }

                    } else {
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  }
              ),

              /// Spare Space
              const SizedBox(height: 40,),
            ],
          ),
        )
      ),
    );
  }

  getCurrentList(List<BookModel> list){
    List<BookModel> currentList = [];

    for(BookModel item in list){
      if(item.lastReadDate != null){
        currentList.add(item);
      }
    }

    //sort by add date
    currentList.sort((a, b) {
      return b.lastReadDate!.compareTo(a.lastReadDate!);
    });

    return currentList.length > 4 ? currentList.getRange(0, 4).toList() : currentList;
  }

}