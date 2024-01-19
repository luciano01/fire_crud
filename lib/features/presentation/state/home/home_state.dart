import 'package:mobx/mobx.dart';

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
    readNotes();
  }

  @observable
  ObservableStream<List<NoteModel>>? listOfNotes;

  Future<void> readNotes() async {
    listOfNotes = _readNotesUseCase.readNotes().asObservable();
  }

  Future<void> updateNote({required NoteModel noteModel}) async {
    NoteModel newNoteModel = noteModel.copyWith(
      isCompleted: !noteModel.isCompleted,
    );
    await _updateNoteUseCase.updateNote(noteModel: newNoteModel);
  }

  Future<void> deleteNote({required NoteModel noteModel}) async {
    await _deleteNoteUseCase.deleteNote(noteModel: noteModel);
  }
}
