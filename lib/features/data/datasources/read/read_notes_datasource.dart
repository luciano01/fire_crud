import '../../data.dart';

abstract class ReadNotesDataSource {
  /// Read NoteModel from FirebaseFirestore.
  Stream<List<Note>> readNotes();
}
