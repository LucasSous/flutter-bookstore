import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bookstore2/src/components/default_button.dart';
import 'package:flutter_bookstore2/src/components/default_text_field.dart';
import 'package:flutter_bookstore2/src/components/default_title.dart';
import 'package:flutter_bookstore2/src/components/select.dart';
import 'package:flutter_bookstore2/src/modules/books/controller/book_controller.dart';
import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookForm extends StatefulWidget {
  final BookModel? book;
  const BookForm({Key? key, required this.book}) : super(key: key);

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _bookController = Modular.get<BookController>();
  final formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  late final String? Function(String? text)? validator;
  late final void Function(String? text)? onSaved;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      if (widget.book != null) {
        final book = widget.book;
        _formData['id'] = book!.id.toString();
        _formData['name'] = book.name;
        _formData['author'] = book.author;
        _formData['publisher'] = book.publisher!.id.toString();
        _formData['launch'] = book.launch.toString();
        _formData['quantity'] = book.quantity.toString();
        _formData['totalRented'] = book.totalRented.toString();
      }
    }
  }

  String titulo() {
    if (_formData['id'] != null) {
      return 'Editar Livro';
    } else {
      return 'Novo Livro';
    }
  }

  String buttomText() {
    if (_formData['id'] != null) {
      return 'Editar';
    } else {
      return 'Salvar';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Observer(builder: (_) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTitle(text: titulo()),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultTextField(
                        labelText: 'Nome',
                        hintText: 'Digite o nome do livro',
                        initialValue: _formData['name'],
                        icon: Icons.book_outlined,
                        validation: (text) {
                          final validation = RegExp('[^A-Za-zÀ-ú ]');
                          if (text == null || text.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (text.length < 3) {
                            return 'O mínimo de caracteres é 3';
                          }
                          if (text.length > 30) {
                            return 'O máximo de caracteres é 30';
                          }
                          if (validation.hasMatch(text)) {
                            return 'Nome inválido';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['name'] = value!,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultTextField(
                        labelText: 'Autor',
                        hintText: 'Digite o nome do autor do livro',
                        initialValue: _formData['author'],
                        icon: Icons.person_outline,
                        validation: (text) {
                          final validation = RegExp('[^A-Za-zÀ-ú ]');
                          if (text == null || text.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (text.length < 3) {
                            return 'O mínimo de caracteres é 3';
                          }
                          if (validation.hasMatch(text)) {
                            return 'Nome de Autor inválido';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['author'] = value!,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Select(
                        hintText: 'Editora',
                        prefixIcon: Icons.align_vertical_bottom_sharp,
                        value: _formData['publisher'],
                        onChanged: (value) {
                          setState(() {
                            _formData['publisher'] = value.toString();
                          });
                        },
                        items: _bookController.publishers.map((item) {
                          return DropdownMenuItem(
                            value: item.id.toString(),
                            child: Text(item.name),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultTextField(
                        labelText: 'Lançamento',
                        hintText: 'Digite o ano de lançamento do livro',
                        initialValue: _formData['launch'],
                        icon: Icons.calendar_today_outlined,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validation: (year) {
                          final int currentYear = DateTime.now().year;
                          if (year == null || year.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (int.parse(year) > currentYear ||
                              int.parse(year) < 1000) {
                            return 'Ano inválido';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['launch'] = value!,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultTextField(
                        labelText: 'Quantidade',
                        hintText: 'Digite a quantidade de livros',
                        initialValue: _formData['quantity'],
                        icon: Icons.library_books_outlined,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validation: (number) {
                          if (number == null || number.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (int.parse(number) < 1) {
                            return 'Valor mínimo é 1';
                          }
                          if (int.parse(number) > 100000) {
                            return 'Valor mínimo é 100.000';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['quantity'] = value!,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultButton(
                        text: buttomText(),
                        isLoading: _bookController.loading,
                        click: _clickButton,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }

  void _clickButton() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (_formData['id'] != null) {
        _bookController.updateBook(
          BookModel(
            id: int.parse(_formData['id']!),
            name: _formData['name']!,
            author: _formData['author']!,
            publisher: PublisherModel(
                id: int.parse(_formData['publisher']!), name: '', city: ''),
            launch: int.parse(_formData['launch']!),
            quantity: int.parse(_formData['quantity']!),
            totalRented: int.parse(_formData['totalRented']!),
          ),
        );
      } else {
        _bookController.createBook(BookModel(
          name: _formData['name']!,
          author: _formData['author']!,
          publisher: PublisherModel(
              id: int.parse(_formData['publisher']!), name: '', city: ''),
          launch: int.parse(_formData['launch']!),
          quantity: int.parse(_formData['quantity']!),
        ));
      }
    }
  }
}
