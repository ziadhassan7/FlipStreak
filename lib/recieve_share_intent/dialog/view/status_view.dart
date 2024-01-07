import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/styles/padding.dart';
import '../../../features/app_common_views/text_view/text_view.dart';

class StatusView extends StatelessWidget {
  final String message;
  final String illustration;

  const StatusView({super.key, required this.message, required this.illustration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 10, horizontal: 8),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getIllustration(),

          _alignmentSpace(),

          TextView(
            message,

            weight: FontWeight.bold,
            size: 18,
          ),

        ],
      ),
    );
  }

  _getIllustration(){
    return Padding(
      padding: const CustomPadding.all(15),

      child: SvgPicture.asset(illustration),
    );
  }

  _alignmentSpace(){
    return const SizedBox(height: 28,);
  }
}
