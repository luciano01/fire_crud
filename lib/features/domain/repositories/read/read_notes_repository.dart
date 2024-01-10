import 'package:fire_crud/features/domain/domain.dart';

abstract class ReadNotesRepository {
  /// Return a List of NoteEntity.
  Stream<List<NoteEntity>> readNotes();
}
