import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../manager/controller/share_note_controller.dart';
import '../../../manager/state_manager/share_loading_provider.dart';
import '../view/share_item.dart';


class NoteSharePage extends ConsumerWidget {
  const NoteSharePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //Open share menu at launch
    executeShareNote(ref);

    return Scaffold(
      backgroundColor: Colors.black,


      /// App bar
      appBar: AppBar(

        foregroundColor: Colors.white,
        backgroundColor: colorAccent,

        actions: [
          ///Share Button
          TextButton(
              onPressed: () async {
                //Open share settings
                await NoteShareController.share();
              },

              child: const Padding(
                padding: CustomPadding(horizontal: 12),
                child: TextView(
                  "Share", size: 18,
                  color: Colors.white, weight: FontWeight.bold,
                ),
              ))
        ],
      ),



      /// Note Item , Loading
      body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const ShareItem(),

                Consumer(
                    builder: (context, ref, _) {
                      final isLoading = ref.watch(shareLoadingProvider);

                      return Visibility(
                          visible: isLoading,
                          child: const Center(child: CircularProgressIndicator(color: Colors.white,)));
                    }
                ),
              ],
            ),
          )),
    );
  }



  /// Function
  //Execute function after build
  Future<void> executeShareNote(WidgetRef ref) async {
    await Future.delayed(const Duration(milliseconds: 500), () async {
      await NoteShareController.share();
      ref.read(shareLoadingProvider.notifier).finished();
    });
  }
}
