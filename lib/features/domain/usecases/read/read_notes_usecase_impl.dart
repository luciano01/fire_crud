import '../../domain.dart';
import '../../../data/data.dart';

abstract class ReadNotesUseCase {
  /// Return a List of NoteModel.
  Stream<List<NoteModel>> readNotes();
}

class ReadNotesUseCaseImp implements ReadNotesUseCase {
  final ReadNotesRepository _readNotesRepository;

  ReadNotesUseCaseImp({required ReadNotesRepository readNotesRepository})
      : _readNotesRepository = readNotesRepository;

  @override
  Stream<List<NoteModel>> readNotes() {
    return _readNotesRepository.readNotes();
  }
}
