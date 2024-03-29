import '../../../domain/domain.dart';
import '../../data.dart';

class CreateNoteRepositoryImpl implements CreateNoteRepository {
  final CreateNoteDataSource _createNoteDataSource;

  CreateNoteRepositoryImpl({required CreateNoteDataSource createNoteDataSource})
      : _createNoteDataSource = createNoteDataSource;

  @override
  Future<void> createNote({required Note noteModel}) async {
    await _createNoteDataSource.createNote(noteModel: noteModel);
  }
}
