import 'package:flip_streak/presentation/notes/presentation/manager/controller/share_note_controller.dart';
import 'package:flip_streak/presentation/notes/presentation/pages/note_share/view/share_item.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../manager/riverpod/share_loading_provider.dart';


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
          TextButton(
              onPressed: () async {
                //Open share settings
                await NoteShareController.share();
              },

              child: Padding(
                padding: const CustomPadding(horizontal: 12),
                child: TextInriaSans(
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
    await Future.delayed(const Duration(milliseconds: 100), () async {
      await NoteShareController.share();
      ref.read(shareLoadingProvider.notifier).finished();
    });
  }
}
