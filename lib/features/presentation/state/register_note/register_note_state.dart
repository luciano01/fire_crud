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
        _deleteNoteUseCase = deleteNoteUseCase {
    _init();
  }

  void _init() {
    if (Modular.args.data != null) {
      NoteModel noteByArgs = Modular.args.data;
      noteModel = noteByArgs;
      title = noteModel.title;
      description = noteModel.description;
      date = noteModel.date;
    }

    isUpdate = Modular.args.data != null;
  }

  NoteModel noteModel = NoteModel.empty();

  @observable
  bool isUpdate = false;

  @observable
  String title = "";

  @observable
  String description = "";

  @observable
  Timestamp date = Timestamp.now();

  @action
  void changeTitle(String value) {
    title = value;
  }

  @action
  void changeDescriptin(String value) {
    description = value;
  }

  @action
  void changeDate(DateTime value) {
    date = Timestamp.fromDate(value);
  }

  @action
  Future<void> saveNote() async {
    try {
      noteModel.title = title;
      noteModel.description = description;
      noteModel.date = date;

      if (Modular.args.data != null) {
        await _updateNoteUseCase.updateNote(noteModel: noteModel);
      } else {
        await _createNoteUseCase.createNote(noteModel: noteModel);
      }
      Modular.to.pop();
    } catch (_) {
    } finally {}
  }

  Future<void> deleteNote() async {
    try {
      if (Modular.args.data != null) {
        await _deleteNoteUseCase.deleteNote(noteModel: noteModel);
      }
      Modular.to.pop();
    } catch (_) {
    } finally {}
  }
}
