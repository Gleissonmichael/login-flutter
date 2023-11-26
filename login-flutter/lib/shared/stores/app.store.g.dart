// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  late final _$isFabBeingShownAtom =
      Atom(name: 'AppStoreBase.isFabBeingShown', context: context);

  @override
  bool get isFabBeingShown {
    _$isFabBeingShownAtom.reportRead();
    return super.isFabBeingShown;
  }

  @override
  set isFabBeingShown(bool value) {
    _$isFabBeingShownAtom.reportWrite(value, super.isFabBeingShown, () {
      super.isFabBeingShown = value;
    });
  }

  late final _$isRequestsBeingShownAtom =
      Atom(name: 'AppStoreBase.isRequestsBeingShown', context: context);

  @override
  bool get isRequestsBeingShown {
    _$isRequestsBeingShownAtom.reportRead();
    return super.isRequestsBeingShown;
  }

  @override
  set isRequestsBeingShown(bool value) {
    _$isRequestsBeingShownAtom.reportWrite(value, super.isRequestsBeingShown,
        () {
      super.isRequestsBeingShown = value;
    });
  }

  late final _$isRequestPageBeingShownAtom =
      Atom(name: 'AppStoreBase.isRequestPageBeingShown', context: context);

  @override
  bool get isRequestPageBeingShown {
    _$isRequestPageBeingShownAtom.reportRead();
    return super.isRequestPageBeingShown;
  }

  @override
  set isRequestPageBeingShown(bool value) {
    _$isRequestPageBeingShownAtom
        .reportWrite(value, super.isRequestPageBeingShown, () {
      super.isRequestPageBeingShown = value;
    });
  }

  late final _$selectedResponseIndexAtom =
      Atom(name: 'AppStoreBase.selectedResponseIndex', context: context);

  @override
  int? get selectedResponseIndex {
    _$selectedResponseIndexAtom.reportRead();
    return super.selectedResponseIndex;
  }

  @override
  set selectedResponseIndex(int? value) {
    _$selectedResponseIndexAtom.reportWrite(value, super.selectedResponseIndex,
        () {
      super.selectedResponseIndex = value;
    });
  }

  @override
  String toString() {
    return '''
isFabBeingShown: ${isFabBeingShown},
isRequestsBeingShown: ${isRequestsBeingShown},
isRequestPageBeingShown: ${isRequestPageBeingShown},
selectedResponseIndex: ${selectedResponseIndex}
    ''';
  }
}
