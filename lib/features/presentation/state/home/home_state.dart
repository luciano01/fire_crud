import 'package:mobx/mobx.dart';

import '../../../data/data.dart';
import '../../../domain/domain.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  final ReadNotesUseCase _readNotesUseCase;

  HomeStateBase({required ReadNotesUseCase readNotesUseCase})
      : _readNotesUseCase = readNotesUseCase {
    readNotes();
  }

  @observable
  ObservableStream<List<NoteModel>>? listOfNotes;

  Future<void> readNotes() async {
    listOfNotes = _readNotesUseCase.readNotes().asObservable();
  }
}
