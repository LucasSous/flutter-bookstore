// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RentController on _RentControllerBase, Store {
  late final _$rentsAtom =
      Atom(name: '_RentControllerBase.rents', context: context);

  @override
  List<Rent> get rents {
    _$rentsAtom.reportRead();
    return super.rents;
  }

  @override
  set rents(List<Rent> value) {
    _$rentsAtom.reportWrite(value, super.rents, () {
      super.rents = value;
    });
  }

  late final _$rentsInProgressAtom =
      Atom(name: '_RentControllerBase.rentsInProgress', context: context);

  @override
  List<Rent> get rentsInProgress {
    _$rentsInProgressAtom.reportRead();
    return super.rentsInProgress;
  }

  @override
  set rentsInProgress(List<Rent> value) {
    _$rentsInProgressAtom.reportWrite(value, super.rentsInProgress, () {
      super.rentsInProgress = value;
    });
  }

  late final _$finishedRentsAtom =
      Atom(name: '_RentControllerBase.finishedRents', context: context);

  @override
  List<Rent> get finishedRents {
    _$finishedRentsAtom.reportRead();
    return super.finishedRents;
  }

  @override
  set finishedRents(List<Rent> value) {
    _$finishedRentsAtom.reportWrite(value, super.finishedRents, () {
      super.finishedRents = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_RentControllerBase.loading', context: context);

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

  late final _$getAllRentsAsyncAction =
      AsyncAction('_RentControllerBase.getAllRents', context: context);

  @override
  Future getAllRents() {
    return _$getAllRentsAsyncAction.run(() => super.getAllRents());
  }

  late final _$getRentsInProgressAsyncAction =
      AsyncAction('_RentControllerBase.getRentsInProgress', context: context);

  @override
  Future getRentsInProgress() {
    return _$getRentsInProgressAsyncAction
        .run(() => super.getRentsInProgress());
  }

  late final _$getFinishedRentsAsyncAction =
      AsyncAction('_RentControllerBase.getFinishedRents', context: context);

  @override
  Future getFinishedRents() {
    return _$getFinishedRentsAsyncAction.run(() => super.getFinishedRents());
  }

  @override
  String toString() {
    return '''
rents: ${rents},
rentsInProgress: ${rentsInProgress},
finishedRents: ${finishedRents},
loading: ${loading}
    ''';
  }
}
