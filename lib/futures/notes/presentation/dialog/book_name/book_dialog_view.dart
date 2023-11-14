import 'package:flip_streak/futures/books/data/local_db/book_client.dart';
import 'package:flutter/material.dart';
import '../../../../books/data/model/book_model.dart';

class BookDialogView extends StatefulWidget {
  const BookDialogView(
      {super.key,
        required this.label,
        required this.controller,
        required this.isNumericValue});

  final String label;
  final TextEditingController controller;
  final bool isNumericValue;

  @override
  State<BookDialogView> createState() => _BookDialogViewState();
}

class _BookDialogViewState extends State<BookDialogView> {

  BookClient bookClient = BookClient.instance;
  static String searchValue = "";

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: getBooksList(),

        builder: (context, snapshot) {

          if(snapshot.hasData){

            List<String> list = snapshot.data!;

            return Autocomplete<String>(
              initialValue: widget.controller.value,

              optionsBuilder: (textValue){
                if(textValue.text.isEmpty){
                  return const Iterable.empty();
                }

                return list.where((element) {
                  return element.contains(textValue.text);
                });
              },

              onSelected: (String item){
                widget.controller.text = item;
              },
            );

          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
    );
  }

  Widget? clearIcon({
    required Function() onPressed,
    required bool shouldShow,
  }){
    if(shouldShow){
      return IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.clear),
      );
    }

    return null;
  }


  Future<List<String>> getBooks() async {
    List<BookModel> books = await bookClient.readAllElements();

    List<String> correspondingBooks = [];

    for(var book in books){
      if(book.id.contains(searchValue)){
        correspondingBooks.add(book.id);
      }
    }

    return correspondingBooks;
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
