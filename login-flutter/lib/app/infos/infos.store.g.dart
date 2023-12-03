// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infos.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfosStore on InfosStoreBase, Store {
  late final _$infosStateAtom =
      Atom(name: 'InfosStoreBase.infosState', context: context);

  @override
  DataState<List<String>> get infosState {
    _$infosStateAtom.reportRead();
    return super.infosState;
  }

  @override
  set infosState(DataState<List<String>> value) {
    _$infosStateAtom.reportWrite(value, super.infosState, () {
      super.infosState = value;
    });
  }

  @override
  String toString() {
    return '''
infosState: ${infosState}
    ''';
  }
}
