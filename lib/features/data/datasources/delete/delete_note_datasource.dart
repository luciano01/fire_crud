import '../../data.dart';

abstract class DeleteNoteDataSource {
  /// Delete a NoteModel from FirebaseFirestore.
  Future<void> deleteNote({required Note noteModel});
}
