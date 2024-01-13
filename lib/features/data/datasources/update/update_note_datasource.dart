import '../../data.dart';

abstract class UpdateNoteDataSource {
  /// Update a NoteModel from FirebaseFirestore.
  Future<void> updateNote({required NoteModel noteModel});
}
