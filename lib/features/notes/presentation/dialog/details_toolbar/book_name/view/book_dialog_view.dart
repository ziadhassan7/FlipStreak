import 'package:flip_streak/features/books/data/local_db/book_client.dart';
import 'package:flip_streak/features/notes/presentation/dialog/details_toolbar/book_name/widget/book_autocomplete_list.dart';
import 'package:flip_streak/features/notes/presentation/dialog/details_toolbar/dialog_text_input.dart';
import 'package:flip_streak/features/notes/presentation/manager/controller/note_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../../books/data/model/book_model.dart';

class BookDialogView extends StatelessWidget {
  BookDialogView({super.key,});

  final BookClient bookClient = BookClient.instance;
  static String searchValue = "";

  FocusNode customFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    //Wait for Book List
    return FutureBuilder(
        future: getBooksList(),

        builder: (context, snapshot) {

          if(snapshot.hasData){

            List<String> list = snapshot.data!;


            /// Auto Complete Text Input
            return RawAutocomplete<String>(
              textEditingController: NoteController.bookName,
              focusNode: customFocusNode,

              optionsBuilder: (TextEditingValue textEditingValue) {
                return list.where((String option) {
                  return option.contains(NoteController.bookName.text);
                });
              },

              // Text Input
              fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController textController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted,) {

                return DialogTextInput(
                  labelText: "Enter book name",
                  textController: NoteController.bookName,
                  isNumericValue: false,
                  focusNode: customFocusNode,
                  onFieldSubmitted: onFieldSubmitted,
                );
              },

              // List showing auto complete options
              optionsViewBuilder: (
                  BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options,) {

                return BookAutoCompleteList(
                    onSelected: onSelected, listOptions: options);
              },
            );

          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
    );
  }


  // Get Book List
  Future<List<String>> getBooksList() async {
    List<BookModel> books = await bookClient.readAllElements();
    List<String> bookNames = [];

    for(var book in books) {
      bookNames.add(book.id);
    }

    return bookNames;
  }
}
