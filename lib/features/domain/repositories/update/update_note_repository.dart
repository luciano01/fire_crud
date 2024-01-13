import '../../domain.dart';

abstract class UpdateNoteRepository {
  /// Update a NoteEntity.
  Future<void> updateNote({required NoteEntity noteEntity});
}
