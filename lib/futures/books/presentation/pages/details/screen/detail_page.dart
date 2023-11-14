import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/books/presentation/managers/state_manager/book_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/app_router.dart';
import '../../../../../app_common_views/book_thumbnail.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../confetti/binding/confetti_details_page.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../book/screen/book_page.dart';
import '../widget/action_buttons/action_buttons_row.dart';
import '../widget/menu/details_menu_icon.dart';
import '../widget/bookmarks/bookmark_list.dart';
import '../widget/edit_button.dart';
import '../widget/page_number_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const _backgroundColor = Color.fromRGBO(255, 250, 248, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,

      /// App Bar
      appBar: AppBar(
        //Title
        title: Consumer(
          builder: (context, ref, _) {
            ref.watch(bookListProvider);
            return TextView(bookModel.id, color: colorAccent, weight: FontWeight.bold,);
          }
        ),

        //settings
        elevation: 0,
        foregroundColor: colorAccent,
        backgroundColor: _backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),

        //action button
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DetailsMenuIcon(),
          )
        ],
      ),


      /// Body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 25, top: 30, bottom: 60),

              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    /// Book Image
                    SizedBox(
                      width: 150, height: 218,
                      child: InkWell(
                          onTap: ()=> AppRouter.navigateTo(context, const BookPage(),),
                          child: BookThumbnail(filePath: bookModel.path,))),

                    const Spacer(),

                    /// Page number
                    const PageNumber(),

                    const SizedBox(width: 10,),

                    /// Edit Last Page - Button
                    const EditPageNumberButton(),
                  ]
              ),
            ),

            /// Read  &  Category - Buttons
            const ActionButtonsRow(),

            const SizedBox(width: 10,),

            /// Bookmarks
            SizedBox(
                height: 340,
                child: BookmarkList()),

            ///Confetti - Congratulations
            const Align(
                alignment: Alignment.topCenter,
                child: ConfettiDetailsPage(),),
          ],
        ),
      )
    );
  }
}
