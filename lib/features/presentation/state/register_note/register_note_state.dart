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
    isUpdate = Modular.args.data != null;

    if (isUpdate) {
      Note toUpdateNote = Modular.args.data;
      noteModel.uid = toUpdateNote.uid;
      noteModel.title = toUpdateNote.title;
      noteModel.description = toUpdateNote.description;
      noteModel.isCompleted = toUpdateNote.isCompleted;
      noteModel.date = toUpdateNote.date;
    } else {
      return;
    }
  }

  @observable
  Note noteModel = Note();

  @observable
  bool isUpdate = false;

  @computed
  bool get isValid => validateTitle() == null && validateDescription() == null;

  String? validateTitle() {
    if (noteModel.title == null) {
      return null;
    } else if (noteModel.title!.isEmpty || noteModel.title!.length < 3) {
      return "Este campo é obrigatório";
    }
    return null;
  }

  String? validateDescription() {
    if (noteModel.description == null) {
      return null;
    } else if (noteModel.description!.isEmpty ||
        noteModel.description!.length < 3) {
      return "Este campo é obrigatório";
    }
    return null;
  }

  Future<void> saveNote() async {
    try {
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
