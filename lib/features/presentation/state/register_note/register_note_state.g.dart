// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_note_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterNoteState on RegisterNoteStateBase, Store {
  late final _$noteModelAtom =
      Atom(name: 'RegisterNoteStateBase.noteModel', context: context);

  @override
  Note get noteModel {
    _$noteModelAtom.reportRead();
    return super.noteModel;
  }

  @override
  set noteModel(Note value) {
    _$noteModelAtom.reportWrite(value, super.noteModel, () {
      super.noteModel = value;
    });
  }

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

  @override
  String toString() {
    return '''
noteModel: ${noteModel},
isUpdate: ${isUpdate}
    ''';
  }
}
