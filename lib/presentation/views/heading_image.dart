import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeadingImage extends StatelessWidget {
  const HeadingImage(this.assetPath, {Key? key, this.haveSpaceOnTop = false, this.isSlimWidget = false}) : super(key: key);

  final String assetPath;
  final bool haveSpaceOnTop;
  final bool isSlimWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding(hor: 30, ver: haveSpaceOnTop ? 30 : 0),

      child: SizedBox(
          height: 110,
          width: isSlimWidget ? 105 : 110,
          child: SvgPicture.asset(
            assetPath,
            fit: BoxFit.fitHeight,
            color: colorAccent.withOpacity(0.2),
          )
      ),
    );
  }
}
