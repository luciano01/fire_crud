import '../../../domain/domain.dart';
import '../../data.dart';

class CreateNoteRepositoryImpl implements CreateNoteRepository {
  final CreateNoteDataSource _createNoteDataSource;

  CreateNoteRepositoryImpl({required CreateNoteDataSource createNoteDataSource})
      : _createNoteDataSource = createNoteDataSource;

  @override
  Future<void> createNote({required NoteModel noteModel}) async {
    throw UnimplementedError();
  }
}
