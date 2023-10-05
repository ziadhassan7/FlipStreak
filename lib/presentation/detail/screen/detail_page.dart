import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/detail/widget/page_number_widget.dart';
import 'package:flip_streak/presentation/detail/widget/action_buttons/action_buttons_row.dart';
import 'package:flip_streak/presentation/detail/widget/edit_button.dart';
import 'package:flip_streak/presentation/styles/device_screen.dart';
import 'package:flutter/material.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../views/book_thumbnail.dart';
import '../../views/text_inria_sans.dart';
import '../widget/details_page_menu.dart';
import '../widget/bookmarks/bookmark_list.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const _backgroundColor = Color.fromRGBO(255, 250, 248, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,

      /// App Bar
      appBar: AppBar(
        title: TextInriaSans(bookModel.id, color: colorAccent, weight: FontWeight.bold,),
        elevation: 0,
        foregroundColor: colorAccent,
        backgroundColor: _backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DetailsPageMenu(),
          )
        ],
      ),


      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 25, top: 30, bottom: 60),

                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        /// Book Image
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                                height: 218,
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
                    height: DeviceScreen(context).height * 0.4,
                    child: BookmarkList())

              ],
            ),
          )
        ],
      ),
    );
  }
}
