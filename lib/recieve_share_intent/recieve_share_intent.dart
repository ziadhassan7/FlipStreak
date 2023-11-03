import 'package:flip_streak/futures/books/presentation/managers/controllers/helpers/add_book_util.dart';
import 'package:flip_streak/index_page/index_page.dart';
import 'package:flip_streak/recieve_share_intent/dialog/failure_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';
import '../index_page/nav_bar_provider.dart';
import 'dialog/already_added_dialog.dart';
import 'dialog/success_dialog.dart';

class ReceiveShareIntent extends ConsumerWidget {
  const ReceiveShareIntent(this.list, {super.key});

  final List<SharedFile> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(

      body: FutureBuilder(
          future: AddBookUtil.addBook(ref, list.first.value),

          builder: (context, AsyncSnapshot<ShareIntentStatus> snapshot){

            if (snapshot.hasData){
              final ShareIntentStatus status = snapshot.data!;
              //open dialog explaining the status
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => _openShareIntentDialogIfExist(context, status));

              //open on library page
              ref.read(navBarProvider.notifier).changeIndex(1);
              return IndexPage();

            } else {
              return const Center(child: CircularProgressIndicator(),);
            }

          }
      ),
    );
  }

  _openShareIntentDialogIfExist(BuildContext context, ShareIntentStatus status){

    String? filePath = list.first.value;

    if(filePath == null) return;

    switch (status){

        case ShareIntentStatus.success:
          SuccessDialog(context, filePath);
          break;

        case ShareIntentStatus.alreadyAdded:
          AlreadyAddedDialog(context, filePath);
          break;

        case ShareIntentStatus.failure:
          FailureDialog(context);
          break;

        default:
          return;
      }

  }
}
