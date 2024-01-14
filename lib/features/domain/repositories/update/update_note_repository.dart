import '../../../data/data.dart';

abstract class UpdateNoteRepository {
  /// Update a NoteModel.
  Future<void> updateNote({required NoteModel noteModel});
}
