import 'package:mobx/mobx.dart';

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
}
