// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on UserControllerBase, Store {
  late final _$usersAtom =
      Atom(name: 'UserControllerBase.users', context: context);

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

  late final _$usersFilterAtom =
      Atom(name: 'UserControllerBase.usersFilter', context: context);

  @override
  List<UserModel> get usersFilter {
    _$usersFilterAtom.reportRead();
    return super.usersFilter;
  }

  @override
  set usersFilter(List<UserModel> value) {
    _$usersFilterAtom.reportWrite(value, super.usersFilter, () {
      super.usersFilter = value;
    });
  }

  late final _$isEmptyInputAtom =
      Atom(name: 'UserControllerBase.isEmptyInput', context: context);

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
      Atom(name: 'UserControllerBase.loading', context: context);

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
      AsyncAction('UserControllerBase.getAllUsers', context: context);

  @override
  Future<void> getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  late final _$createUserAsyncAction =
      AsyncAction('UserControllerBase.createUser', context: context);

  @override
  Future<void> createUser(UserModel user) {
    return _$createUserAsyncAction.run(() => super.createUser(user));
  }

  late final _$updateUserAsyncAction =
      AsyncAction('UserControllerBase.updateUser', context: context);

  @override
  Future<void> updateUser(UserModel user) {
    return _$updateUserAsyncAction.run(() => super.updateUser(user));
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('UserControllerBase.deleteUser', context: context);

  @override
  Future<void> deleteUser(UserModel user) {
    return _$deleteUserAsyncAction.run(() => super.deleteUser(user));
  }

  late final _$UserControllerBaseActionController =
      ActionController(name: 'UserControllerBase', context: context);

  @override
  void filter(String value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.filter');
    try {
      return super.filter(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilter() {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.resetFilter');
    try {
      return super.resetFilter();
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
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
