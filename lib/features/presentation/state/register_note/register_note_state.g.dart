// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_note_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterNoteState on RegisterNoteStateBase, Store {
  late final _$nameAtom =
      Atom(name: 'RegisterNoteStateBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$dateAtom =
      Atom(name: 'RegisterNoteStateBase.date', context: context);

  @override
  Timestamp get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(Timestamp value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$saveNoteAsyncAction =
      AsyncAction('RegisterNoteStateBase.saveNote', context: context);

  @override
  Future<void> saveNote() {
    return _$saveNoteAsyncAction.run(() => super.saveNote());
  }

  late final _$RegisterNoteStateBaseActionController =
      ActionController(name: 'RegisterNoteStateBase', context: context);

  @override
  void changeName(String value) {
    final _$actionInfo = _$RegisterNoteStateBaseActionController.startAction(
        name: 'RegisterNoteStateBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$RegisterNoteStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDate(DateTime value) {
    final _$actionInfo = _$RegisterNoteStateBaseActionController.startAction(
        name: 'RegisterNoteStateBase.changeDate');
    try {
      return super.changeDate(value);
    } finally {
      _$RegisterNoteStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
date: ${date}
    ''';
  }
}
