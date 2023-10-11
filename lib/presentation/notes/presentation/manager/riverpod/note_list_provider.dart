import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/data_source/note_client.dart';
import '../../../data/model/note_model.dart';

final noteListProvider = StateNotifierProvider<NoteProvider, List<NoteModel>>((ref) {

  return NoteProvider();
});


class NoteProvider extends StateNotifier<List<NoteModel>> {
  NoteClient noteClient = NoteClient.instance;

  NoteProvider() : super([]) {
    listFiles();
  }


  /// State Function
  updateNotifier() async {
    List<NoteModel> notes = await noteClient.readAllElements();
    state = notes.reversed.toList(); //reverse list
  }

  /// ---------------------------------------------------------------


  /// Returns All Items
  void listFiles() async {
    //Get List of all notes
    await updateNotifier();
  }

  /// Add New Note
  void addNote(NoteModel newModel) async {

    //Create new Note Item
    noteClient.createItem(newModel);

    //Get List of all books
    await updateNotifier();
  }

  /// Delete Note
  void deleteNote(String noteId) async {

    //Create new Note Item
    noteClient.deleteItem(noteId);

    //Get List of all books
    await updateNotifier();
  }

  /// Delete Note
  void deleteAllNotesInBook(String bookId) async {

    //Delete all notes in a book
    List<NoteModel> notes = await noteClient.readAllElements();
    for(var item in notes){
      if(item.noteBookName == bookId){
        noteClient.deleteItem(item.noteId);
      }
    }

    //Get List of all books
    await updateNotifier();
  }
}