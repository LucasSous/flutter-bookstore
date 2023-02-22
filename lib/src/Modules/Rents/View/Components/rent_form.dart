import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_button.dart';
import 'package:flutter_bookstore2/src/Components/default_text_field.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Components/select.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Model/book_model.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Model/user_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class RentForm extends StatefulWidget {
  final Rent? rent;
  const RentForm({super.key, required this.rent});

  @override
  State<RentForm> createState() => _RentFormState();
}

class _RentFormState extends State<RentForm> {
  final formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  late final String? Function(String? text)? validator;
  late final void Function(String? text)? onSaved;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      // ignore: unnecessary_null_comparison
      if (widget.rent != null) {
        final rent = widget.rent;
        _formData['id'] = rent!.id.toString();
        _formData['user'] = rent.user!.id.toString();
        _formData['book'] = rent.book!.id.toString();
        _formData['forecastDate'] = rent.forecastDate;
      }
    }
  }

  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final rentController = Modular.get<RentController>();
    final userController = Modular.get<UserController>();
    final bookController = Modular.get<BookController>();
    final users = userController.users;
    final books = bookController.books;
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
                      const DefaultTitle(text: 'Novo Aluguél'),
                      const SizedBox(
                        height: 30,
                      ),
                      Select(
                        hintText: 'Usuário',
                        prefixIcon: Icons.person_outline,
                        value: _formData['user'],
                        onChanged: (value) {
                          setState(() {
                            _formData['user'] = value.toString();
                          });
                        },
                        items: users.map((item) {
                          return DropdownMenuItem(
                            value: item.id.toString(),
                            child: Text(item.name),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Select(
                        hintText: 'Livro',
                        prefixIcon: Icons.book_outlined,
                        value: _formData['book'],
                        onChanged: (value) {
                          setState(() {
                            _formData['book'] = value.toString();
                          });
                        },
                        items: books.map((item) {
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
                        labelText: 'Previsão de entrega',
                        hintText: 'Selecione uma data',
                        controller: _date,
                        readOnly: true,
                        icon: Icons.calendar_today_outlined,
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 0)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Theme.of(context).primaryColor,
                                    onPrimary: Colors.white,
                                    onSurface:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (pickeddate != null) {
                            setState(() {
                              _date.text =
                                  DateFormat('dd/MM/yyyy').format(pickeddate);
                            });
                          }
                        },
                        validation: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['forecastDate'] = value!,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultButton(
                        text: 'Salvar',
                        isLoading: rentController.loading,
                        click: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            String? date = _formData['forecastDate'];
                            List<String> returnDate = date!.split('/');
                            DateTime? forecastDate = DateTime.parse(
                                '${returnDate[2]}-${returnDate[1]}-${returnDate[0]}');
                            rentController.createRent(Rent(
                              user: User(
                                  id: _formData['user'],
                                  name: '',
                                  city: '',
                                  address: '',
                                  email: ''),
                              book: Book(
                                  id: _formData['book'],
                                  name: '',
                                  author: '',
                                  publisher: null,
                                  launch: '',
                                  quantity: ''),
                              creationDate: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now())
                                  .toString(),
                              forecastDate: DateFormat('yyyy-MM-dd')
                                  .format(forecastDate)
                                  .toString(),
                              returnDate: null,
                            ));
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
