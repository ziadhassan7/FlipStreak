import 'package:flip_streak/presentation/styles/device_screen.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {

    double screenSize = DeviceScreen(context).height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        //"assets/illustrations/bookshelf_ill.svg"
        Visibility(
            visible: screenSize > 500, //hide when screen rotates
            child: SvgPicture.asset("assets/illustrations/bookshelf_ill_sec.svg", height: 180,)),

        _verticalPadding(40),

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
}
