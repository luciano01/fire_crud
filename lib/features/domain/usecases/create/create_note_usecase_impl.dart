import '../../../data/data.dart';
import '../../domain.dart';

abstract class CreateNoteUseCase {
  /// Create a NoteEntity.
  Future<void> createNote({required NoteModel noteModel});
}

class CreateNoteUseCaseImpl implements CreateNoteUseCase {
  final CreateNoteRepository _createNoteRepository;

  CreateNoteUseCaseImpl({required CreateNoteRepository createNoteRepository})
      : _createNoteRepository = createNoteRepository;

  @override
  Future<void> createNote({required NoteModel noteModel}) async {
    await _createNoteRepository.createNote(noteModel: noteModel);
  }
}
