import '../../../data/data.dart';

abstract class CreateNoteRepository {
  /// Create a Note.
  Future<void> createNote({required NoteModel noteModel});
}
