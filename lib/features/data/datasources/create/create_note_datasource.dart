import '../../data.dart';

abstract class CreateNoteDataSource {
  /// Create a NoteModel and returna a DocumentReference from Firebase Firestore.
  Future<void> createNote({required Note noteModel});
}
