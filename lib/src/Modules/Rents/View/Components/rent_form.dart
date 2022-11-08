import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_button.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Components/select.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

  @override
  Widget build(BuildContext context) {
    final rentController = Modular.get<RentController>();
    final userController = Modular.get<UserController>();
    final bookController = Modular.get<BookController>();
    final users = userController.users;
    final books = bookController.books;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent),
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
                        height: 25,
                      ),
                      DefaultButton(
                        text: 'Salvar',
                        isLoading: rentController.loading,
                        click: () {},
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
