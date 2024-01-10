import '../../domain.dart';

abstract class CreateNoteRepository {
  /// Create a Note and return a DocumentReference.
  Future<void> createNote({required NoteEntity noteEntity});
}
