// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
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

  late final _$setValuesAsyncAction =
      AsyncAction('HomeControllerBase.setValues', context: context);

  @override
  Future setValues() {
    return _$setValuesAsyncAction.run(() => super.setValues());
  }

  @override
  String toString() {
    return '''
inProgress: ${inProgress},
late: ${late},
onTime: ${onTime},
pending: ${pending}
    ''';
  }
}
