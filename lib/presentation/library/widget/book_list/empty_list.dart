import 'package:flip_streak/presentation/styles/device_screen.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../business/app_wise/add_book_util.dart';
import '../../../../data/shared_pref/hive_client.dart';

class EmptyList extends ConsumerWidget {
  const EmptyList({super.key, required this.currentFilter});

  final String currentFilter;
  static final HiveClient _hiveClient = HiveClient();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    double screenSize = DeviceScreen(context).height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        /// Illustration
        Visibility(
            visible: screenSize > 500, //hide when screen is too short
            child: InkWell(
                //disable splash
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,

                onTap: () async => AddBookUtil.addBook(ref,
                    currentCategory: await getCategory(currentFilter)),

                child: SvgPicture.asset(
                  height: 180,
                  "assets/illustrations/bookshelf_ill_sec.svg",
                )
            )),

        _verticalPadding(40),


        /// Text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            _customText(context, "Still Empty!", isBold: true,),
            const SizedBox(width: 8,),
            _customText(context, "Add Some Books",),
          ],
        ),
      ],
    );
  }

  /// Widgets
  static Widget _customText(BuildContext context, String text, {bool isBold = false,}){

    return TextInriaSans(
      text,

      size: 16,
      maxLine: 4,
      textAlign: TextAlign.center,

      color: Colors.brown.withOpacity(0.6), //colorAccent.withOpacity(0.8),
      weight: isBold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static Widget _verticalPadding(double amount){
    return SizedBox(height: amount,);
  }


  /// Functions
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
