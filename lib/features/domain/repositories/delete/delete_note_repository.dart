import '../../domain.dart';

abstract class DeleteNoteRepository {
  /// Delete a NoteEntity.
  Future<void> deleteNote({required NoteEntity noteEntity});
}
