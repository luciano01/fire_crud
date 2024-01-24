// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Note on NoteBase, Store {
  late final _$uidAtom = Atom(name: 'NoteBase.uid', context: context);

  @override
  String? get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String? value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  late final _$titleAtom = Atom(name: 'NoteBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'NoteBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$isCompletedAtom =
      Atom(name: 'NoteBase.isCompleted', context: context);

  @override
  bool? get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool? value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  late final _$dateAtom = Atom(name: 'NoteBase.date', context: context);

  @override
  Timestamp? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(Timestamp? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$NoteBaseActionController =
      ActionController(name: 'NoteBase', context: context);

  @override
  dynamic setTitle(String newValue) {
    final _$actionInfo =
        _$NoteBaseActionController.startAction(name: 'NoteBase.setTitle');
    try {
      return super.setTitle(newValue);
    } finally {
      _$NoteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String newValue) {
    final _$actionInfo =
        _$NoteBaseActionController.startAction(name: 'NoteBase.setDescription');
    try {
      return super.setDescription(newValue);
    } finally {
      _$NoteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsCompleted(bool newValue) {
    final _$actionInfo =
        _$NoteBaseActionController.startAction(name: 'NoteBase.setIsCompleted');
    try {
      return super.setIsCompleted(newValue);
    } finally {
      _$NoteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDate(Timestamp newValue) {
    final _$actionInfo =
        _$NoteBaseActionController.startAction(name: 'NoteBase.setDate');
    try {
      return super.setDate(newValue);
    } finally {
      _$NoteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uid: ${uid},
title: ${title},
description: ${description},
isCompleted: ${isCompleted},
date: ${date}
    ''';
  }
}
