// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_note_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterNoteState on RegisterNoteStateBase, Store {
  late final _$isUpdateAtom =
      Atom(name: 'RegisterNoteStateBase.isUpdate', context: context);

  @override
  bool get isUpdate {
    _$isUpdateAtom.reportRead();
    return super.isUpdate;
  }

  @override
  set isUpdate(bool value) {
    _$isUpdateAtom.reportWrite(value, super.isUpdate, () {
      super.isUpdate = value;
    });
  }

  late final _$titleAtom =
      Atom(name: 'RegisterNoteStateBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'RegisterNoteStateBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
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
  void changeTitle(String value) {
    final _$actionInfo = _$RegisterNoteStateBaseActionController.startAction(
        name: 'RegisterNoteStateBase.changeTitle');
    try {
      return super.changeTitle(value);
    } finally {
      _$RegisterNoteStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDescriptin(String value) {
    final _$actionInfo = _$RegisterNoteStateBaseActionController.startAction(
        name: 'RegisterNoteStateBase.changeDescriptin');
    try {
      return super.changeDescriptin(value);
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
isUpdate: ${isUpdate},
title: ${title},
description: ${description},
date: ${date}
    ''';
  }
}
