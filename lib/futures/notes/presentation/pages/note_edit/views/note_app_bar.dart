import 'package:flip_streak/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../manager/controller/back_controller.dart';
import '../../../manager/state_manager/share_loading_provider.dart';
import '../../note_share/screen/note_share_page.dart';

class NoteAppBar extends StatelessWidget {
  const NoteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Row(
        children: [
          ///                                                                   / Back Button
          IconButton(
            onPressed: (){
              BackController.onBackPressed(context);
            },

            icon: const Icon(Icons.arrow_back_ios)),

          const Spacer(),

          ///                                                                   / Share Button

          Consumer(
            builder: (context, ref, _) {
              return IconButton(
                onPressed: ()=> _onShare(context, ref),
                icon: const Icon(Icons.share_outlined)
              );
            }
          )

        ],
      ),
    );
  }

  Future<void> _onShare(BuildContext context, WidgetRef ref) async {
    //reset loading provider before opening screen
    ref.invalidate(shareLoadingProvider);
    //open share screen
    AppRouter.navigateTo(context, const NoteSharePage());
  }
}
