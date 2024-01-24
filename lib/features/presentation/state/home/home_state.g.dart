// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on HomeStateBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'HomeStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'HomeStateBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$listOfNotesAtom =
      Atom(name: 'HomeStateBase.listOfNotes', context: context);

  @override
  ObservableStream<List<Note>>? get listOfNotes {
    _$listOfNotesAtom.reportRead();
    return super.listOfNotes;
  }

  @override
  set listOfNotes(ObservableStream<List<Note>>? value) {
    _$listOfNotesAtom.reportWrite(value, super.listOfNotes, () {
      super.listOfNotes = value;
    });
  }

  late final _$_readNotesAsyncAction =
      AsyncAction('HomeStateBase._readNotes', context: context);

  @override
  Future<void> _readNotes() {
    return _$_readNotesAsyncAction.run(() => super._readNotes());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
listOfNotes: ${listOfNotes}
    ''';
  }
}
