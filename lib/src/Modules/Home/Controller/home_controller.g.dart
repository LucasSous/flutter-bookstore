// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$rentsAtom =
      Atom(name: 'HomeControllerBase.rents', context: context);

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

  late final _$usersAtom =
      Atom(name: 'HomeControllerBase.users', context: context);

  @override
  List<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$booksAtom =
      Atom(name: 'HomeControllerBase.books', context: context);

  @override
  List<Book> get books {
    _$booksAtom.reportRead();
    return super.books;
  }

  @override
  set books(List<Book> value) {
    _$booksAtom.reportWrite(value, super.books, () {
      super.books = value;
    });
  }

  late final _$mostRentedAtom =
      Atom(name: 'HomeControllerBase.mostRented', context: context);

  @override
  List<Book> get mostRented {
    _$mostRentedAtom.reportRead();
    return super.mostRented;
  }

  @override
  set mostRented(List<Book> value) {
    _$mostRentedAtom.reportWrite(value, super.mostRented, () {
      super.mostRented = value;
    });
  }

  late final _$publishersAtom =
      Atom(name: 'HomeControllerBase.publishers', context: context);

  @override
  List<Publisher> get publishers {
    _$publishersAtom.reportRead();
    return super.publishers;
  }

  @override
  set publishers(List<Publisher> value) {
    _$publishersAtom.reportWrite(value, super.publishers, () {
      super.publishers = value;
    });
  }

  late final _$loadingRentsAtom =
      Atom(name: 'HomeControllerBase.loadingRents', context: context);

  @override
  bool get loadingRents {
    _$loadingRentsAtom.reportRead();
    return super.loadingRents;
  }

  @override
  set loadingRents(bool value) {
    _$loadingRentsAtom.reportWrite(value, super.loadingRents, () {
      super.loadingRents = value;
    });
  }

  late final _$loadingUsersAtom =
      Atom(name: 'HomeControllerBase.loadingUsers', context: context);

  @override
  bool get loadingUsers {
    _$loadingUsersAtom.reportRead();
    return super.loadingUsers;
  }

  @override
  set loadingUsers(bool value) {
    _$loadingUsersAtom.reportWrite(value, super.loadingUsers, () {
      super.loadingUsers = value;
    });
  }

  late final _$loadingBooksAtom =
      Atom(name: 'HomeControllerBase.loadingBooks', context: context);

  @override
  bool get loadingBooks {
    _$loadingBooksAtom.reportRead();
    return super.loadingBooks;
  }

  @override
  set loadingBooks(bool value) {
    _$loadingBooksAtom.reportWrite(value, super.loadingBooks, () {
      super.loadingBooks = value;
    });
  }

  late final _$loadingPublishersAtom =
      Atom(name: 'HomeControllerBase.loadingPublishers', context: context);

  @override
  bool get loadingPublishers {
    _$loadingPublishersAtom.reportRead();
    return super.loadingPublishers;
  }

  @override
  set loadingPublishers(bool value) {
    _$loadingPublishersAtom.reportWrite(value, super.loadingPublishers, () {
      super.loadingPublishers = value;
    });
  }

  late final _$loadingMostRentedsAtom =
      Atom(name: 'HomeControllerBase.loadingMostRenteds', context: context);

  @override
  bool get loadingMostRenteds {
    _$loadingMostRentedsAtom.reportRead();
    return super.loadingMostRenteds;
  }

  @override
  set loadingMostRenteds(bool value) {
    _$loadingMostRentedsAtom.reportWrite(value, super.loadingMostRenteds, () {
      super.loadingMostRenteds = value;
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

  late final _$getAllRentsAsyncAction =
      AsyncAction('HomeControllerBase.getAllRents', context: context);

  @override
  Future getAllRents() {
    return _$getAllRentsAsyncAction.run(() => super.getAllRents());
  }

  late final _$getAllUsersAsyncAction =
      AsyncAction('HomeControllerBase.getAllUsers', context: context);

  @override
  Future getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  late final _$getAllBooksAsyncAction =
      AsyncAction('HomeControllerBase.getAllBooks', context: context);

  @override
  Future getAllBooks() {
    return _$getAllBooksAsyncAction.run(() => super.getAllBooks());
  }

  late final _$getMostRentedAsyncAction =
      AsyncAction('HomeControllerBase.getMostRented', context: context);

  @override
  Future getMostRented() {
    return _$getMostRentedAsyncAction.run(() => super.getMostRented());
  }

  late final _$getAllPublishersAsyncAction =
      AsyncAction('HomeControllerBase.getAllPublishers', context: context);

  @override
  Future getAllPublishers() {
    return _$getAllPublishersAsyncAction.run(() => super.getAllPublishers());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  dynamic setValues() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setValues');
    try {
      return super.setValues();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rents: ${rents},
users: ${users},
books: ${books},
mostRented: ${mostRented},
publishers: ${publishers},
loadingRents: ${loadingRents},
loadingUsers: ${loadingUsers},
loadingBooks: ${loadingBooks},
loadingPublishers: ${loadingPublishers},
loadingMostRenteds: ${loadingMostRenteds},
inProgress: ${inProgress},
late: ${late},
onTime: ${onTime},
pending: ${pending}
    ''';
  }
}
