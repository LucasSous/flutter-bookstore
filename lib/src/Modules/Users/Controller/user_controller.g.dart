// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on _UserControllerBase, Store {
  late final _$usersAtom =
      Atom(name: '_UserControllerBase.users', context: context);

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

  late final _$usersFilterAtom =
      Atom(name: '_UserControllerBase.usersFilter', context: context);

  @override
  List<User> get usersFilter {
    _$usersFilterAtom.reportRead();
    return super.usersFilter;
  }

  @override
  set usersFilter(List<User> value) {
    _$usersFilterAtom.reportWrite(value, super.usersFilter, () {
      super.usersFilter = value;
    });
  }

  late final _$isEmptyInputAtom =
      Atom(name: '_UserControllerBase.isEmptyInput', context: context);

  @override
  bool get isEmptyInput {
    _$isEmptyInputAtom.reportRead();
    return super.isEmptyInput;
  }

  @override
  set isEmptyInput(bool value) {
    _$isEmptyInputAtom.reportWrite(value, super.isEmptyInput, () {
      super.isEmptyInput = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_UserControllerBase.loading', context: context);

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

  late final _$getAllUsersAsyncAction =
      AsyncAction('_UserControllerBase.getAllUsers', context: context);

  @override
  Future getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  late final _$createUserAsyncAction =
      AsyncAction('_UserControllerBase.createUser', context: context);

  @override
  Future createUser(User user) {
    return _$createUserAsyncAction.run(() => super.createUser(user));
  }

  late final _$updateUserAsyncAction =
      AsyncAction('_UserControllerBase.updateUser', context: context);

  @override
  Future updateUser(User user) {
    return _$updateUserAsyncAction.run(() => super.updateUser(user));
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('_UserControllerBase.deleteUser', context: context);

  @override
  Future deleteUser(User user) {
    return _$deleteUserAsyncAction.run(() => super.deleteUser(user));
  }

  late final _$filterAsyncAction =
      AsyncAction('_UserControllerBase.filter', context: context);

  @override
  Future filter(String value) {
    return _$filterAsyncAction.run(() => super.filter(value));
  }

  late final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase', context: context);

  @override
  dynamic resetFilter() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.resetFilter');
    try {
      return super.resetFilter();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
usersFilter: ${usersFilter},
isEmptyInput: ${isEmptyInput},
loading: ${loading}
    ''';
  }
}
