import 'package:flip_streak/business/route_util.dart';
import 'package:flutter/material.dart';

import '../../note_share/note_share_page.dart';

class NoteAppBar extends StatelessWidget {
  const NoteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Row(
        children: [
          ///                                                                   / Back Button
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios)),

          const Spacer(),

          ///                                                                   / Share Button

          IconButton(
            onPressed: ()=> _onShare(context),
            icon: const Icon(Icons.share_outlined)
          )

        ],
      ),
    );
  }

  void _onShare(BuildContext context){
    RouteUtil.navigateTo(context, const NoteSharePage());
  }
}
