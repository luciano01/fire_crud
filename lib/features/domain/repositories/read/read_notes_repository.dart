import '../../../data/data.dart';

abstract class ReadNotesRepository {
  /// Return a List of NoteModel.
  Stream<List<NoteModel>> readNotes();
}
