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

  // Take only the changed value,
  // and assign the rest to the same data
  NoteModel copyWith({
    String? noteId,
    String? noteTitle,
    String? noteBody,

    String? notePage,
    String? noteBookName,
  }){
    return NoteModel(
        noteId: noteId ?? this.noteId,
        noteTitle: noteTitle ?? this.noteTitle,
        noteBody: noteBody ?? this.noteBody,
        notePage: notePage ?? this.notePage,
        noteBookName: noteBookName ?? this.noteBookName,);
  }


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