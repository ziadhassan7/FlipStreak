import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../managers/state_manager/welcome_screen_provider.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// Info
          TextView(getTitle(), size: 30, color: colorAccent, ),

          const SizedBox(height: 10,),

          RichText(
            text: TextSpan(
              text: getInfo(),
              style: TextStyle(fontSize: 20, color: Colors.brown.shade700,),
              children: <TextSpan>[
                TextSpan(text: getInfoTail(), style: TextStyle(color: colorAccent.withOpacity(0.8))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getTitle(){
    switch(currentPage){
      case Pages.firstPage:
        return "Pages' Goal";
      case Pages.secondPage:
        return "Books Goal";
      case Pages.thirdPage:
        return "Notification";
    }
  }


  getInfo(){
    switch(currentPage){
      case Pages.firstPage:
        return "The number of pages you want to read";
      case Pages.secondPage:
        return "The number of books you want to read";
      case Pages.thirdPage:
        return "Get reminded if you are going to lose your streak";
    }
  }

  getInfoTail(){
    switch(currentPage){
      case Pages.firstPage:
        return " every day";
      case Pages.secondPage:
        return " this year";
      case Pages.thirdPage:
        return "";
    }
  }
}
