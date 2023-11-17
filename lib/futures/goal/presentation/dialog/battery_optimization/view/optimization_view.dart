import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';

class OptimizationView extends StatelessWidget {
  const OptimizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 10, horizontal: 8),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextView(
            "Disable battery optimization",

            weight: FontWeight.bold,
            size: 18,
          ),

          _alignmentSpace(),

          _getIllustration(),

          _alignmentSpace(),

          const TextView(
            "battery optimization may prevent background notification.",

            size: 13,
            color: Colors.black45,
            maxLine: 5,
          ),

          _alignmentSpace(),

          const TextView(
            "Please turn off, or allow disabling battery optimization.",

            size: 13,
            weight: FontWeight.bold,
            color: Colors.black45,
            maxLine: 5,
          ),

        ],
      ),
    );
  }



  static _getIllustration(){
    return Padding(
      padding: const CustomPadding.all(15),

      child: SvgPicture.asset("assets/illustrations/optimize_battery_ill.svg"),
    );
  }

  _alignmentSpace(){
    return const SizedBox(height: 12,);
  }
}
