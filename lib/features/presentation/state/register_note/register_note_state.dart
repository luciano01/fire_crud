import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';

part 'register_note_state.g.dart';

class RegisterNoteState = RegisterNoteStateBase with _$RegisterNoteState;

abstract class RegisterNoteStateBase with Store {
  final CreateNoteUseCase _createNoteUseCase;

  RegisterNoteStateBase({required CreateNoteUseCase createNoteUseCase})
      : _createNoteUseCase = createNoteUseCase;
}
