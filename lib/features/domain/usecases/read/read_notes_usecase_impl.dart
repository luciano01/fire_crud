import 'package:fire_crud/features/domain/domain.dart';

abstract class ReadNotesUseCase {
  /// Return a List of NoteEntity.
  Stream<List<NoteEntity>> readNotes();
}

class ReadNotesUseCaseImp implements ReadNotesUseCase {
  final ReadNotesRepository _readNotesRepository;

  ReadNotesUseCaseImp({required ReadNotesRepository readNotesRepository})
      : _readNotesRepository = readNotesRepository;

  @override
  Stream<List<NoteEntity>> readNotes() {
    return _readNotesRepository.readNotes();
  }
}
