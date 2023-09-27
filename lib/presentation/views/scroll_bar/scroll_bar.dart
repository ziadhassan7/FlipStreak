import 'package:flip_streak/business/app_wise/controllers/book_controller.dart';
import 'package:flip_streak/business/app_wise/controllers/page_controller.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/scroll_bar/scroll_indicator.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flip_streak/provider/scroll_page_indicator_provider.dart';
import 'package:flip_streak/provider/scroll_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../styles/box_decoration.dart';

class CustomScrollBar extends ConsumerWidget {
  const CustomScrollBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PositionedDirectional(
      end: 0,
      top: ref.watch(scrollViewProvider),

      child: Row(
        children: [
          Visibility(
            visible: ref.watch(scrollPageIndicatorProvider),

            child: Material(
              elevation: 1,

              child: Container(
                padding: const CustomPadding(hor: 15, ver: 10),
                decoration: CustomDecoration(
                  backgroundColor: Colors.white,
                  radius: 30
                ),
                child: FutureBuilder(
                  future: pdfController.getCurrentPage(),
                  builder: (context, AsyncSnapshot snapshot) {

                    if(snapshot.hasData){
                      return TextInriaSans("${snapshot.data}/${getTotalPages()}");

                    } else {
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  }
                ),
              ),
            ),
          ),

          const SizedBox(width: 10,),

          const ScrollIndicator(),
        ],
      ),
    );
  }
}
