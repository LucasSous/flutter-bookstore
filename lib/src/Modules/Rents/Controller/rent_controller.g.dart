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
  List<RentModel> get rents {
    _$rentsAtom.reportRead();
    return super.rents;
  }

  @override
  set rents(List<RentModel> value) {
    _$rentsAtom.reportWrite(value, super.rents, () {
      super.rents = value;
    });
  }

  late final _$usersAtom =
      Atom(name: '_RentControllerBase.users', context: context);

  @override
  List<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$booksAtom =
      Atom(name: '_RentControllerBase.books', context: context);

  @override
  List<BookModel> get books {
    _$booksAtom.reportRead();
    return super.books;
  }

  @override
  set books(List<BookModel> value) {
    _$booksAtom.reportWrite(value, super.books, () {
      super.books = value;
    });
  }

  late final _$rentsInProgressAtom =
      Atom(name: '_RentControllerBase.rentsInProgress', context: context);

  @override
  List<RentModel> get rentsInProgress {
    _$rentsInProgressAtom.reportRead();
    return super.rentsInProgress;
  }

  @override
  set rentsInProgress(List<RentModel> value) {
    _$rentsInProgressAtom.reportWrite(value, super.rentsInProgress, () {
      super.rentsInProgress = value;
    });
  }

  late final _$finishedRentsAtom =
      Atom(name: '_RentControllerBase.finishedRents', context: context);

  @override
  List<RentModel> get finishedRents {
    _$finishedRentsAtom.reportRead();
    return super.finishedRents;
  }

  @override
  set finishedRents(List<RentModel> value) {
    _$finishedRentsAtom.reportWrite(value, super.finishedRents, () {
      super.finishedRents = value;
    });
  }

  late final _$defaultValueRentsInProgressAtom = Atom(
      name: '_RentControllerBase.defaultValueRentsInProgress',
      context: context);

  @override
  List<RentModel> get defaultValueRentsInProgress {
    _$defaultValueRentsInProgressAtom.reportRead();
    return super.defaultValueRentsInProgress;
  }

  @override
  set defaultValueRentsInProgress(List<RentModel> value) {
    _$defaultValueRentsInProgressAtom
        .reportWrite(value, super.defaultValueRentsInProgress, () {
      super.defaultValueRentsInProgress = value;
    });
  }

  late final _$defaultValueFinishedRentsAtom = Atom(
      name: '_RentControllerBase.defaultValueFinishedRents', context: context);

  @override
  List<RentModel> get defaultValueFinishedRents {
    _$defaultValueFinishedRentsAtom.reportRead();
    return super.defaultValueFinishedRents;
  }

  @override
  set defaultValueFinishedRents(List<RentModel> value) {
    _$defaultValueFinishedRentsAtom
        .reportWrite(value, super.defaultValueFinishedRents, () {
      super.defaultValueFinishedRents = value;
    });
  }

  late final _$rentsFilterAtom =
      Atom(name: '_RentControllerBase.rentsFilter', context: context);

  @override
  List<RentModel> get rentsFilter {
    _$rentsFilterAtom.reportRead();
    return super.rentsFilter;
  }

  @override
  set rentsFilter(List<RentModel> value) {
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

  late final _$getAllUsersAsyncAction =
      AsyncAction('_RentControllerBase.getAllUsers', context: context);

  @override
  Future<void> getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  late final _$getAllBooksAsyncAction =
      AsyncAction('_RentControllerBase.getAllBooks', context: context);

  @override
  Future<void> getAllBooks() {
    return _$getAllBooksAsyncAction.run(() => super.getAllBooks());
  }

  late final _$getAllRentsAsyncAction =
      AsyncAction('_RentControllerBase.getAllRents', context: context);

  @override
  Future<void> getAllRents() {
    return _$getAllRentsAsyncAction.run(() => super.getAllRents());
  }

  late final _$createRentAsyncAction =
      AsyncAction('_RentControllerBase.createRent', context: context);

  @override
  Future<void> createRent(RentModel rent) {
    return _$createRentAsyncAction.run(() => super.createRent(rent));
  }

  late final _$updateRentAsyncAction =
      AsyncAction('_RentControllerBase.updateRent', context: context);

  @override
  Future<void> updateRent(RentModel rent) {
    return _$updateRentAsyncAction.run(() => super.updateRent(rent));
  }

  late final _$deleteRentAsyncAction =
      AsyncAction('_RentControllerBase.deleteRent', context: context);

  @override
  Future<void> deleteRent(RentModel rent) {
    return _$deleteRentAsyncAction.run(() => super.deleteRent(rent));
  }

  late final _$_RentControllerBaseActionController =
      ActionController(name: '_RentControllerBase', context: context);

  @override
  void getRentsInProgress(bool showAll) {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.getRentsInProgress');
    try {
      return super.getRentsInProgress(showAll);
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getFinishedRents(bool showAll) {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.getFinishedRents');
    try {
      return super.getFinishedRents(showAll);
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterFinishedRents(dynamic status) {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.filterFinishedRents');
    try {
      return super.filterFinishedRents(status);
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterRents(dynamic date) {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.filterRents');
    try {
      return super.filterRents(date);
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterRentsInProgress(dynamic status) {
    final _$actionInfo = _$_RentControllerBaseActionController.startAction(
        name: '_RentControllerBase.filterRentsInProgress');
    try {
      return super.filterRentsInProgress(status);
    } finally {
      _$_RentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLists() {
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
users: ${users},
books: ${books},
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
