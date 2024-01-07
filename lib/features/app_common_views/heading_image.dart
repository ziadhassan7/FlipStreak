import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/styles/padding.dart';

class HeadingImage extends StatelessWidget {
  const HeadingImage(this.assetPath, {Key? key, this.haveSpaceOnTop = false, this.isSlimWidget = false}) : super(key: key);

  final String assetPath;
  final bool haveSpaceOnTop;
  final bool isSlimWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding(horizontal: 30, vertical: haveSpaceOnTop ? 30 : 0),

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
