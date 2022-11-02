// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PublisherController on _PublisherControllerBase, Store {
  late final _$publishersAtom =
      Atom(name: '_PublisherControllerBase.publishers', context: context);

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

  late final _$publishersFilterAtom =
      Atom(name: '_PublisherControllerBase.publishersFilter', context: context);

  @override
  List<Publisher> get publishersFilter {
    _$publishersFilterAtom.reportRead();
    return super.publishersFilter;
  }

  @override
  set publishersFilter(List<Publisher> value) {
    _$publishersFilterAtom.reportWrite(value, super.publishersFilter, () {
      super.publishersFilter = value;
    });
  }

  late final _$isEmptyInputAtom =
      Atom(name: '_PublisherControllerBase.isEmptyInput', context: context);

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
      Atom(name: '_PublisherControllerBase.loading', context: context);

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

  late final _$getAllPublishersAsyncAction = AsyncAction(
      '_PublisherControllerBase.getAllPublishers',
      context: context);

  @override
  Future getAllPublishers() {
    return _$getAllPublishersAsyncAction.run(() => super.getAllPublishers());
  }

  late final _$createPublisherAsyncAction =
      AsyncAction('_PublisherControllerBase.createPublisher', context: context);

  @override
  Future createPublisher(Publisher publisher) {
    return _$createPublisherAsyncAction
        .run(() => super.createPublisher(publisher));
  }

  late final _$updatePublisherAsyncAction =
      AsyncAction('_PublisherControllerBase.updatePublisher', context: context);

  @override
  Future updatePublisher(Publisher publisher) {
    return _$updatePublisherAsyncAction
        .run(() => super.updatePublisher(publisher));
  }

  late final _$deletePublisherAsyncAction =
      AsyncAction('_PublisherControllerBase.deletePublisher', context: context);

  @override
  Future deletePublisher(Publisher publisher) {
    return _$deletePublisherAsyncAction
        .run(() => super.deletePublisher(publisher));
  }

  late final _$filterAsyncAction =
      AsyncAction('_PublisherControllerBase.filter', context: context);

  @override
  Future filter(String value) {
    return _$filterAsyncAction.run(() => super.filter(value));
  }

  late final _$_PublisherControllerBaseActionController =
      ActionController(name: '_PublisherControllerBase', context: context);

  @override
  dynamic resetFilter() {
    final _$actionInfo = _$_PublisherControllerBaseActionController.startAction(
        name: '_PublisherControllerBase.resetFilter');
    try {
      return super.resetFilter();
    } finally {
      _$_PublisherControllerBaseActionController.endAction(_$actionInfo);
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
