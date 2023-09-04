import 'package:flutter/material.dart';

import '../../../app_constants/color_constants.dart';
import '../../../provider/welcome_screen_provider.dart';
import '../../styles/box_decoration.dart';

class NavigationDots extends StatelessWidget {
  const NavigationDots(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(var item in Pages.values)
          dot(item == currentPage),
      ],
    );
  }

  Widget dot(bool isSelected){
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Container(
        height: 10, width: 10,
        decoration: CustomDecoration(
            backgroundColor: isSelected ? colorAccent : Colors.black12,
            radius: 10,
            isCircular: true),
      ),
    );
  }
}
