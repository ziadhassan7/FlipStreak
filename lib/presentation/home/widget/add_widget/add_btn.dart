import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flip_streak/provider/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:pdfx/pdfx.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../business/app_wise/controllers/book_controller.dart';
import '../../../../business/file_util.dart';
import '../../../../business/route_util.dart';
import '../../../../data/model/book_model.dart';
import '../../../../provider/book_list_provider.dart';
import '../../../views/circular_button.dart';

class AddIconButton extends StatelessWidget {
  AddIconButton({Key? key}) : super(key: key);

  late BookModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {

          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),

              child: CircularButton(
                onTap: () => addBook(ref),
                color: const Color.fromRGBO(242, 193, 162, 1), // Button color
                icon: const Icon(Icons.add, color: colorDark,),
              )
          );
        }
    );
  }


  void addBook(WidgetRef ref) {
    //pick file
    RouteUtil.pickFiles().then((files) async {
      //upon success open picker page

      if(files != null){

        for(PlatformFile file in files){ //add each book in list

          if(await isDuplicate(basename(file.path!)) == false) {
            String newPath = await FileUtility.copyFile(File(file.path!));

            model = BookModel(id: basename(file.path!),
              path: newPath,
              bookmarks: null,
              lastPage: 0,
              totalPages: await getTotalPages(newPath),
              category: null,
              addDate: DateTime.now().toString(),
              completeDate: null,
              isComplete: 0,
              lastReadDate: null
            );

            bookClient.createItem(model);
            ref.read(bookListProvider.notifier).listFiles();
          }
        }


      }

    // Open library page, when adding books
    }).whenComplete(() {
      ref.read(navBarProvider.notifier).changeIndex(1);
    });
  }


  Future<bool> isDuplicate(String fileName) async {
    List<BookModel> all = await bookClient.readAllElements();

    for(int i =0; i<all.length; i++) {
      if (all[i].id == fileName) return true;
    }

    return false;
  }

  Future<int> getTotalPages(String filePath) async {
    PdfDocument document = await PdfDocument.openFile(filePath);
    int page = document.pagesCount - 1;

    return page;
  }
}
