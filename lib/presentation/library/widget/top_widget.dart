import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app_constants/color_constants.dart';
import '../../views/text_inria_sans.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 32),

      child: Row(
        children: [
          TextInriaSans("Your", size: 28, color: colorAccent,),
          TextInriaSans("Bookshelf", size: 28, weight: FontWeight.bold, color: colorAccent),

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
