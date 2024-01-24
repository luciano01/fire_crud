import '../../../data/data.dart';
import '../../domain.dart';

abstract class UpdateNoteUseCase {
  /// Update a NoteEntity.
  Future<void> updateNote({required Note noteModel});
}

class UpdateNoteUseCaseImpl implements UpdateNoteUseCase {
  final UpdateNoteRepository _updateNoteRepository;

  UpdateNoteUseCaseImpl({required UpdateNoteRepository updateNoteRepository})
      : _updateNoteRepository = updateNoteRepository;

  @override
  Future<void> updateNote({required Note noteModel}) async {
    await _updateNoteRepository.updateNote(noteModel: noteModel);
  }
}
