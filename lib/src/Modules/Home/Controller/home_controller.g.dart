// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$usersQuantityAtom =
      Atom(name: 'HomeControllerBase.usersQuantity', context: context);

  @override
  String get usersQuantity {
    _$usersQuantityAtom.reportRead();
    return super.usersQuantity;
  }

  @override
  set usersQuantity(String value) {
    _$usersQuantityAtom.reportWrite(value, super.usersQuantity, () {
      super.usersQuantity = value;
    });
  }

  late final _$booksQuantityAtom =
      Atom(name: 'HomeControllerBase.booksQuantity', context: context);

  @override
  String get booksQuantity {
    _$booksQuantityAtom.reportRead();
    return super.booksQuantity;
  }

  @override
  set booksQuantity(String value) {
    _$booksQuantityAtom.reportWrite(value, super.booksQuantity, () {
      super.booksQuantity = value;
    });
  }

  late final _$publishersQuantityAtom =
      Atom(name: 'HomeControllerBase.publishersQuantity', context: context);

  @override
  String get publishersQuantity {
    _$publishersQuantityAtom.reportRead();
    return super.publishersQuantity;
  }

  @override
  set publishersQuantity(String value) {
    _$publishersQuantityAtom.reportWrite(value, super.publishersQuantity, () {
      super.publishersQuantity = value;
    });
  }

  late final _$rentsQuantityAtom =
      Atom(name: 'HomeControllerBase.rentsQuantity', context: context);

  @override
  String get rentsQuantity {
    _$rentsQuantityAtom.reportRead();
    return super.rentsQuantity;
  }

  @override
  set rentsQuantity(String value) {
    _$rentsQuantityAtom.reportWrite(value, super.rentsQuantity, () {
      super.rentsQuantity = value;
    });
  }

  late final _$inProgressAtom =
      Atom(name: 'HomeControllerBase.inProgress', context: context);

  @override
  int get inProgress {
    _$inProgressAtom.reportRead();
    return super.inProgress;
  }

  @override
  set inProgress(int value) {
    _$inProgressAtom.reportWrite(value, super.inProgress, () {
      super.inProgress = value;
    });
  }

  late final _$lateAtom =
      Atom(name: 'HomeControllerBase.late', context: context);

  @override
  int get late {
    _$lateAtom.reportRead();
    return super.late;
  }

  @override
  set late(int value) {
    _$lateAtom.reportWrite(value, super.late, () {
      super.late = value;
    });
  }

  late final _$onTimeAtom =
      Atom(name: 'HomeControllerBase.onTime', context: context);

  @override
  int get onTime {
    _$onTimeAtom.reportRead();
    return super.onTime;
  }

  @override
  set onTime(int value) {
    _$onTimeAtom.reportWrite(value, super.onTime, () {
      super.onTime = value;
    });
  }

  late final _$pendingAtom =
      Atom(name: 'HomeControllerBase.pending', context: context);

  @override
  int get pending {
    _$pendingAtom.reportRead();
    return super.pending;
  }

  @override
  set pending(int value) {
    _$pendingAtom.reportWrite(value, super.pending, () {
      super.pending = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'HomeControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$getUsersQuantityAsyncAction =
      AsyncAction('HomeControllerBase.getUsersQuantity', context: context);

  @override
  Future<void> getUsersQuantity() {
    return _$getUsersQuantityAsyncAction.run(() => super.getUsersQuantity());
  }

  late final _$getBooksQuantityAsyncAction =
      AsyncAction('HomeControllerBase.getBooksQuantity', context: context);

  @override
  Future<void> getBooksQuantity() {
    return _$getBooksQuantityAsyncAction.run(() => super.getBooksQuantity());
  }

  late final _$getPublishersQuantityAsyncAction =
      AsyncAction('HomeControllerBase.getPublishersQuantity', context: context);

  @override
  Future<void> getPublishersQuantity() {
    return _$getPublishersQuantityAsyncAction
        .run(() => super.getPublishersQuantity());
  }

  late final _$getRentsQuantityAsyncAction =
      AsyncAction('HomeControllerBase.getRentsQuantity', context: context);

  @override
  Future<void> getRentsQuantity() {
    return _$getRentsQuantityAsyncAction.run(() => super.getRentsQuantity());
  }

  late final _$getBooksMostRentedAsyncAction =
      AsyncAction('HomeControllerBase.getBooksMostRented', context: context);

  @override
  Future<void> getBooksMostRented() {
    return _$getBooksMostRentedAsyncAction
        .run(() => super.getBooksMostRented());
  }

  late final _$setValuesAsyncAction =
      AsyncAction('HomeControllerBase.setValues', context: context);

  @override
  Future<void> setValues() {
    return _$setValuesAsyncAction.run(() => super.setValues());
  }

  @override
  String toString() {
    return '''
usersQuantity: ${usersQuantity},
booksQuantity: ${booksQuantity},
publishersQuantity: ${publishersQuantity},
rentsQuantity: ${rentsQuantity},
inProgress: ${inProgress},
late: ${late},
onTime: ${onTime},
pending: ${pending},
loading: ${loading}
    ''';
  }
}
