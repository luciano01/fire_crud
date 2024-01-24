import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  final ReadNotesUseCase _readNotesUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  HomeStateBase({
    required ReadNotesUseCase readNotesUseCase,
    required UpdateNoteUseCase updateNoteUseCase,
    required DeleteNoteUseCase deleteNoteUseCase,
  })  : _readNotesUseCase = readNotesUseCase,
        _updateNoteUseCase = updateNoteUseCase,
        _deleteNoteUseCase = deleteNoteUseCase {
    _readNotes();
  }

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableStream<List<Note>>? listOfNotes;

  @action
  Future<void> _readNotes() async {
    isLoading = true;
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      try {
        listOfNotes = _readNotesUseCase.readNotes().asObservable();
      } on ServerException catch (error) {
        errorMessage = error.errorMessage;
      } finally {
        isLoading = false;
      }
    });
  }

  Future<void> updateNote({required Note noteModelToUpdate}) async {
    /* NoteModel newNoteModel = noteModel.copyWith(
      isCompleted: !noteModel.isCompleted,
    ); */
    await _updateNoteUseCase.updateNote(noteModel: noteModelToUpdate);
  }

  Future<void> deleteNote({required Note noteModel}) async {
    await _deleteNoteUseCase.deleteNote(noteModel: noteModel);
  }
}
