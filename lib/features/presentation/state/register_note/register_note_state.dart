import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../data/data.dart';
import '../../../domain/domain.dart';

part 'register_note_state.g.dart';

class RegisterNoteState = RegisterNoteStateBase with _$RegisterNoteState;

abstract class RegisterNoteStateBase with Store {
  final CreateNoteUseCase _createNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  RegisterNoteStateBase({
    required CreateNoteUseCase createNoteUseCase,
    required UpdateNoteUseCase updateNoteUseCase,
    required DeleteNoteUseCase deleteNoteUseCase,
  })  : _createNoteUseCase = createNoteUseCase,
        _updateNoteUseCase = updateNoteUseCase,
        _deleteNoteUseCase = deleteNoteUseCase;

  NoteModel noteModel = NoteModel.empty();

  @observable
  String name = "";

  @observable
  Timestamp date = Timestamp.now();

  @action
  void changeName(String value) {
    name = value;
  }

  @action
  void changeDate(DateTime value) {
    date = Timestamp.fromDate(value);
  }

  @action
  Future<void> saveNote() async {
    try {
      noteModel.name = name;
      noteModel.date = date;

      await _createNoteUseCase.createNote(noteModel: noteModel);
      Modular.to.pop();
    } catch (_) {
    } finally {}
  }
}
