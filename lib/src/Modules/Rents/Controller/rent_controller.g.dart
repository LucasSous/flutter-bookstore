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

  late final _$defaultValueRentsInProgressAtom = Atom(
      name: '_RentControllerBase.defaultValueRentsInProgress',
      context: context);

  @override
  List<Rent> get defaultValueRentsInProgress {
    _$defaultValueRentsInProgressAtom.reportRead();
    return super.defaultValueRentsInProgress;
  }

  @override
  set defaultValueRentsInProgress(List<Rent> value) {
    _$defaultValueRentsInProgressAtom
        .reportWrite(value, super.defaultValueRentsInProgress, () {
      super.defaultValueRentsInProgress = value;
    });
  }

  late final _$defaultValueFinishedRentsAtom = Atom(
      name: '_RentControllerBase.defaultValueFinishedRents', context: context);

  @override
  List<Rent> get defaultValueFinishedRents {
    _$defaultValueFinishedRentsAtom.reportRead();
    return super.defaultValueFinishedRents;
  }

  @override
  set defaultValueFinishedRents(List<Rent> value) {
    _$defaultValueFinishedRentsAtom
        .reportWrite(value, super.defaultValueFinishedRents, () {
      super.defaultValueFinishedRents = value;
    });
  }

  late final _$rentsFilterAtom =
      Atom(name: '_RentControllerBase.rentsFilter', context: context);

  @override
  List<Rent> get rentsFilter {
    _$rentsFilterAtom.reportRead();
    return super.rentsFilter;
  }

  @override
  set rentsFilter(List<Rent> value) {
    _$rentsFilterAtom.reportWrite(value, super.rentsFilter, () {
      super.rentsFilter = value;
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

  late final _$loadingDeleteAtom =
      Atom(name: '_RentControllerBase.loadingDelete', context: context);

  @override
  bool get loadingDelete {
    _$loadingDeleteAtom.reportRead();
    return super.loadingDelete;
  }

  @override
  set loadingDelete(bool value) {
    _$loadingDeleteAtom.reportWrite(value, super.loadingDelete, () {
      super.loadingDelete = value;
    });
  }

  late final _$loadingFinishedAtom =
      Atom(name: '_RentControllerBase.loadingFinished', context: context);

  @override
  bool get loadingFinished {
    _$loadingFinishedAtom.reportRead();
    return super.loadingFinished;
  }

  @override
  set loadingFinished(bool value) {
    _$loadingFinishedAtom.reportWrite(value, super.loadingFinished, () {
      super.loadingFinished = value;
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
  Future getRentsInProgress(bool showAll) {
    return _$getRentsInProgressAsyncAction
        .run(() => super.getRentsInProgress(showAll));
  }

  late final _$getFinishedRentsAsyncAction =
      AsyncAction('_RentControllerBase.getFinishedRents', context: context);

  @override
  Future getFinishedRents(bool showAll) {
    return _$getFinishedRentsAsyncAction
        .run(() => super.getFinishedRents(showAll));
  }

  late final _$createRentAsyncAction =
      AsyncAction('_RentControllerBase.createRent', context: context);

  @override
  Future createRent(Rent rent) {
    return _$createRentAsyncAction.run(() => super.createRent(rent));
  }

  late final _$updateRentAsyncAction =
      AsyncAction('_RentControllerBase.updateRent', context: context);

  @override
  Future updateRent(Rent rent) {
    return _$updateRentAsyncAction.run(() => super.updateRent(rent));
  }

  late final _$deleteRentAsyncAction =
      AsyncAction('_RentControllerBase.deleteRent', context: context);

  @override
  Future deleteRent(Rent rent) {
    return _$deleteRentAsyncAction.run(() => super.deleteRent(rent));
  }

  late final _$_RentControllerBaseActionController =
      ActionController(name: '_RentControllerBase', context: context);

  @override
  dynamic filterFinishedRents(dynamic status) {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.filterFinishedRents');
    try {
      return super.filterFinishedRents(status);
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterRents(dynamic date) {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.filterRents');
    try {
      return super.filterRents(date);
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterRentsInProgress(dynamic status) {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.filterRentsInProgress');
    try {
      return super.filterRentsInProgress(status);
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateLists() {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.updateLists');
    try {
      return super.updateLists();
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rents: ${rents},
rentsInProgress: ${rentsInProgress},
finishedRents: ${finishedRents},
defaultValueRentsInProgress: ${defaultValueRentsInProgress},
defaultValueFinishedRents: ${defaultValueFinishedRents},
rentsFilter: ${rentsFilter},
loading: ${loading},
loadingDelete: ${loadingDelete},
loadingFinished: ${loadingFinished}
    ''';
  }
}
