import '../../domain.dart';

abstract class CreateNoteRepository {
  /// Create a Note.
  Future<void> createNote({required NoteEntity noteEntity});
}
