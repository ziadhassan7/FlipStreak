import 'package:flip_streak/futures/books/data/local_db/book_client.dart';
import 'package:flip_streak/futures/notes/presentation/dialog/details_toolbar/book_name/widget/book_autocomplete_list.dart';
import 'package:flip_streak/futures/notes/presentation/dialog/details_toolbar/dialog_text_input.dart';
import 'package:flutter/material.dart';
import '../../../../../../books/data/model/book_model.dart';

class BookDialogView extends StatelessWidget {
  BookDialogView({super.key,});

  final BookClient bookClient = BookClient.instance;
  static String searchValue = "";

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: getBooksList(),

        builder: (context, snapshot) {

          if(snapshot.hasData){

            List<String> list = snapshot.data!;

            return RawAutocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                return list.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },

              fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController textController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted,) {

                return DialogTextInput(
                  labelText: "Enter book name",
                  textController: textController,
                  isNumericValue: false,
                  focusNode: focusNode,
                  onFieldSubmitted: onFieldSubmitted,
                );
              },

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

  Future<List<String>> getBooksList() async {
    List<BookModel> books = await bookClient.readAllElements();
    List<String> bookNames = [];

    for(var book in books) {
      bookNames.add(book.id);
    }

    return bookNames;
  }
}
