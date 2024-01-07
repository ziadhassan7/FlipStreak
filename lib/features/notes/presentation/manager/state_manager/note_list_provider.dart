import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/local_db/note_client.dart';
import '../../../data/model/note_model.dart';
import '../controller/note_controller.dart';

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

    //Get List of all notes
    await updateNotifier();
  }

  /// Add New Note
  void updateNote(NoteModel newModel) async {

    //Create new Note Item
    noteClient.updateItem(newModel);

    //Get List of all notes
    await updateNotifier();
  }

  Future<void> renameBookForAllNotes(String oldName, String newName) async {
    await NoteController.updateAllNotesWithNewBookName(oldName, newName); //update all notes associated with this book

    //Get List of all notes
    await updateNotifier();
  }

  /// Delete Note
  void deleteNote(String noteId) async {

    //Create new Note Item
    noteClient.deleteItem(noteId);

    //Get List of all notes
    await updateNotifier();
  }
}