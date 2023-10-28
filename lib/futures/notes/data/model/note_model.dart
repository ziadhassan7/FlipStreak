import '../../../../core/constants/db_constants/note_db_constants.dart';

class NoteModel {

  final String noteId;
  final String? noteTitle;
  final String noteBody;

  final String notePage;
  final String noteBookName;

  NoteModel({
    required this.noteId,
    this.noteTitle,
    required this.noteBody,

    required this.notePage,
    required this.noteBookName,
  });


  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      noteId: map[columnNoteId],
      noteTitle: map[columnNoteTitle],
      noteBody: map[columnNoteBody],

      notePage: map[columnNotePage],
      noteBookName: map[columnNoteBookName],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      columnNoteId: noteId,
      columnNoteTitle: noteTitle,
      columnNoteBody: noteBody,

      columnNotePage: notePage,
      columnNoteBookName: noteBookName,
    };
  }
}