import '../../../data/data.dart';

abstract class DeleteNoteRepository {
  /// Delete a NoteModel.
  Future<void> deleteNote({required Note noteModel});
}
