import '../../../data/data.dart';

abstract class CreateNoteRepository {
  /// Create a Note.
  Future<void> createNote({required Note noteModel});
}
