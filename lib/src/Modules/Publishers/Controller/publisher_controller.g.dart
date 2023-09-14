// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PublisherController on PublisherControllerBase, Store {
  late final _$publishersAtom =
      Atom(name: 'PublisherControllerBase.publishers', context: context);

  @override
  List<PublisherModel> get publishers {
    _$publishersAtom.reportRead();
    return super.publishers;
  }

  @override
  set publishers(List<PublisherModel> value) {
    _$publishersAtom.reportWrite(value, super.publishers, () {
      super.publishers = value;
    });
  }

  late final _$publishersFilterAtom =
      Atom(name: 'PublisherControllerBase.publishersFilter', context: context);

  @override
  List<PublisherModel> get publishersFilter {
    _$publishersFilterAtom.reportRead();
    return super.publishersFilter;
  }

  @override
  set publishersFilter(List<PublisherModel> value) {
    _$publishersFilterAtom.reportWrite(value, super.publishersFilter, () {
      super.publishersFilter = value;
    });
  }

  late final _$isEmptyInputAtom =
      Atom(name: 'PublisherControllerBase.isEmptyInput', context: context);

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
      Atom(name: 'PublisherControllerBase.loading', context: context);

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

  late final _$getAllPublishersAsyncAction =
      AsyncAction('PublisherControllerBase.getAllPublishers', context: context);

  @override
  Future<void> getAllPublishers() {
    return _$getAllPublishersAsyncAction.run(() => super.getAllPublishers());
  }

  late final _$createPublisherAsyncAction =
      AsyncAction('PublisherControllerBase.createPublisher', context: context);

  @override
  Future<void> createPublisher(PublisherModel publisher) {
    return _$createPublisherAsyncAction
        .run(() => super.createPublisher(publisher));
  }

  late final _$updatePublisherAsyncAction =
      AsyncAction('PublisherControllerBase.updatePublisher', context: context);

  @override
  Future<void> updatePublisher(PublisherModel publisher) {
    return _$updatePublisherAsyncAction
        .run(() => super.updatePublisher(publisher));
  }

  late final _$deletePublisherAsyncAction =
      AsyncAction('PublisherControllerBase.deletePublisher', context: context);

  @override
  Future<void> deletePublisher(PublisherModel publisher) {
    return _$deletePublisherAsyncAction
        .run(() => super.deletePublisher(publisher));
  }

  late final _$PublisherControllerBaseActionController =
      ActionController(name: 'PublisherControllerBase', context: context);

  @override
  void filter(String value) {
    final _$actionInfo = _$PublisherControllerBaseActionController.startAction(
        name: 'PublisherControllerBase.filter');
    try {
      return super.filter(value);
    } finally {
      _$PublisherControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilter() {
    final _$actionInfo = _$PublisherControllerBaseActionController.startAction(
        name: 'PublisherControllerBase.resetFilter');
    try {
      return super.resetFilter();
    } finally {
      _$PublisherControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
publishers: ${publishers},
publishersFilter: ${publishersFilter},
isEmptyInput: ${isEmptyInput},
loading: ${loading}
    ''';
  }
}
