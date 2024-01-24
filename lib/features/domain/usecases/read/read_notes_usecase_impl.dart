import '../../domain.dart';
import '../../../data/data.dart';

abstract class ReadNotesUseCase {
  /// Return a List of NoteModel.
  Stream<List<Note>> readNotes();
}

class ReadNotesUseCaseImp implements ReadNotesUseCase {
  final ReadNotesRepository _readNotesRepository;

  ReadNotesUseCaseImp({required ReadNotesRepository readNotesRepository})
      : _readNotesRepository = readNotesRepository;

  @override
  Stream<List<Note>> readNotes() {
    return _readNotesRepository.readNotes();
  }
}
