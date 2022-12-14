import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bookstore2/src/Components/default_button.dart';
import 'package:flutter_bookstore2/src/Components/default_text_field.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Components/select.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Model/book_model.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Model/publisher_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookForm extends StatefulWidget {
  final Book? book;
  const BookForm({Key? key, required this.book}) : super(key: key);

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
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

  titulo() {
    if (_formData['id'] != null) {
      return 'Editar Livro';
    } else {
      return 'Novo Livro';
    }
  }

  buttomText() {
    if (_formData['id'] != null) {
      return 'Editar';
    } else {
      return 'Salvar';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookController = Modular.get<BookController>();
    final publisherController = Modular.get<PublisherController>();
    final publishers = publisherController.publishers;
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
                          final validation = RegExp('[^A-Za-z??-?? ]');
                          if (text == null || text.isEmpty) {
                            return 'Campo obrigat??rio';
                          }
                          if (text.length < 3) {
                            return 'O m??nimo de caracteres ?? 3';
                          }
                          if (text.length > 30) {
                            return 'O m??ximo de caracteres ?? 30';
                          }
                          if (validation.hasMatch(text)) {
                            return 'Nome inv??lido';
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
                          final validation = RegExp('[^A-Za-z??-?? ]');
                          if (text == null || text.isEmpty) {
                            return 'Campo obrigat??rio';
                          }
                          if (text.length < 3) {
                            return 'O m??nimo de caracteres ?? 3';
                          }
                          if (validation.hasMatch(text)) {
                            return 'Nome de Autor inv??lido';
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
                        items: publishers.map((item) {
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
                        labelText: 'Lan??amento',
                        hintText: 'Digite o ano de lan??amento do livro',
                        initialValue: _formData['launch'],
                        icon: Icons.calendar_today_outlined,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validation: (year) {
                          final int currentYear = DateTime.now().year;
                          if (year == null || year.isEmpty) {
                            return 'Campo obrigat??rio';
                          }
                          if (int.parse(year) > currentYear ||
                              int.parse(year) < 1000) {
                            return 'Ano inv??lido';
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
                            return 'Campo obrigat??rio';
                          }
                          if (int.parse(number) < 1) {
                            return 'Valor m??nimo ?? 1';
                          }
                          if (int.parse(number) > 100000) {
                            return 'Valor m??nimo ?? 100.000';
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
                        isLoading: bookController.loading,
                        click: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            if (_formData['id'] != null) {
                              bookController.updateBook(Book(
                                  id: _formData['id'],
                                  name: _formData['name'],
                                  author: _formData['author'],
                                  publisher: Publisher(
                                      id: _formData['publisher'],
                                      name: '',
                                      city: ''),
                                  launch: _formData['launch'],
                                  quantity: _formData['quantity'],
                                  totalRented: _formData['totalRented']));
                            } else {
                              bookController.createBook(Book(
                                name: _formData['name'],
                                author: _formData['author'],
                                publisher: Publisher(
                                    id: _formData['publisher'],
                                    name: '',
                                    city: ''),
                                launch: _formData['launch'],
                                quantity: _formData['quantity'],
                              ));
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
