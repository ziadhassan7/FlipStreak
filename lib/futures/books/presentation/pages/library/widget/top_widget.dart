import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 32),

      child: Row(
        children: [
          const TextView("Your", size: 28, color: colorAccent,),
          const TextView("Bookshelf", size: 28, weight: FontWeight.bold, color: colorAccent),

          const Spacer(),

          Padding(
            padding: const CustomPadding(right: 10),
            child: SvgPicture.asset(
              width: 40, height: 40,
              "assets/headings/library_heading.svg",
              fit: BoxFit.fitHeight,
              color: colorAccent.withOpacity(0.1),
            ),
          )
        ],
      ),
    );
  }
}
