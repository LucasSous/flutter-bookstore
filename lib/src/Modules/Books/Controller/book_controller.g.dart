// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookController on _BookControllerBase, Store {
  late final _$booksAtom =
      Atom(name: '_BookControllerBase.books', context: context);

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

  late final _$booksFilterAtom =
      Atom(name: '_BookControllerBase.booksFilter', context: context);

  @override
  List<Book> get booksFilter {
    _$booksFilterAtom.reportRead();
    return super.booksFilter;
  }

  @override
  set booksFilter(List<Book> value) {
    _$booksFilterAtom.reportWrite(value, super.booksFilter, () {
      super.booksFilter = value;
    });
  }

  late final _$mostRentedAtom =
      Atom(name: '_BookControllerBase.mostRented', context: context);

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

  late final _$isEmptyInputAtom =
      Atom(name: '_BookControllerBase.isEmptyInput', context: context);

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
      Atom(name: '_BookControllerBase.loading', context: context);

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

  late final _$loadingMostRentedsAtom =
      Atom(name: '_BookControllerBase.loadingMostRenteds', context: context);

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

  late final _$getAllBooksAsyncAction =
      AsyncAction('_BookControllerBase.getAllBooks', context: context);

  @override
  Future getAllBooks() {
    return _$getAllBooksAsyncAction.run(() => super.getAllBooks());
  }

  late final _$getMostRentedAsyncAction =
      AsyncAction('_BookControllerBase.getMostRented', context: context);

  @override
  Future getMostRented() {
    return _$getMostRentedAsyncAction.run(() => super.getMostRented());
  }

  late final _$createBookAsyncAction =
      AsyncAction('_BookControllerBase.createBook', context: context);

  @override
  Future createBook(Book book) {
    return _$createBookAsyncAction.run(() => super.createBook(book));
  }

  late final _$updateBookAsyncAction =
      AsyncAction('_BookControllerBase.updateBook', context: context);

  @override
  Future updateBook(Book book) {
    return _$updateBookAsyncAction.run(() => super.updateBook(book));
  }

  late final _$deleteBookAsyncAction =
      AsyncAction('_BookControllerBase.deleteBook', context: context);

  @override
  Future deleteBook(Book book) {
    return _$deleteBookAsyncAction.run(() => super.deleteBook(book));
  }

  late final _$filterAsyncAction =
      AsyncAction('_BookControllerBase.filter', context: context);

  @override
  Future filter(String value) {
    return _$filterAsyncAction.run(() => super.filter(value));
  }

  late final _$_BookControllerBaseActionController =
      ActionController(name: '_BookControllerBase', context: context);

  @override
  dynamic resetFilter() {
    final _$actionInfo = _$_BookControllerBaseActionController.startAction(
        name: '_BookControllerBase.resetFilter');
    try {
      return super.resetFilter();
    } finally {
      _$_BookControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
books: ${books},
booksFilter: ${booksFilter},
mostRented: ${mostRented},
isEmptyInput: ${isEmptyInput},
loading: ${loading},
loadingMostRenteds: ${loadingMostRenteds}
    ''';
  }
}
