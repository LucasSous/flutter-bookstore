import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_button.dart';
import 'package:flutter_bookstore2/src/Components/default_text_field.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Model/user_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserForm extends StatefulWidget {
  final User? user;
  const UserForm({Key? key, required this.user}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  late final String? Function(String? text)? validator;
  late final void Function(String? text)? onSaved;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      if (widget.user != null) {
        final user = widget.user;
        _formData['id'] = user!.id.toString();
        _formData['name'] = user.name;
        _formData['address'] = user.address;
        _formData['city'] = user.city;
        _formData['email'] = user.email;
      }
    }
  }

  titulo() {
    if (_formData['id'] != null) {
      return 'Editar Usuário';
    } else {
      return 'Novo Usuário';
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
    final userController = Modular.get<UserController>();
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      titulo(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DefaultTextField(
                      labelText: 'Nome',
                      hintText: 'Digite o nome do usuário',
                      initialValue: _formData['name'],
                      icon: Icons.person_outline,
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        if (text.length < 3) {
                          return 'O mínimo de caracteres é 3';
                        }
                        if (text.length > 30) {
                          return 'O máximo de caracteres é 30';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['name'] = value!,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DefaultTextField(
                      labelText: 'E-mail',
                      hintText: 'Digite o e-mail do usuário',
                      initialValue: _formData['email'],
                      icon: Icons.email_outlined,
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['email'] = value!,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DefaultTextField(
                      labelText: 'Endereço',
                      hintText: 'Digite o endereço do usuário',
                      initialValue: _formData['address'],
                      icon: Icons.location_on_outlined,
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        if (text.length < 3) {
                          return 'O mínimo de caracteres é 3';
                        }
                        if (text.length > 50) {
                          return 'O máximo de caracteres é 50';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['address'] = value!,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DefaultTextField(
                      labelText: 'Cidade',
                      hintText: 'Digite a cidade usuário',
                      initialValue: _formData['city'],
                      icon: Icons.location_city,
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        if (text.length < 3) {
                          return 'O mínimo de caracteres é 3';
                        }
                        if (text.length > 20) {
                          return 'O máximo de caracteres é 20';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['city'] = value!,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DefaultButton(
                      text: buttomText(),
                      isLoading: userController.loading,
                      click: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          if (_formData['id'] != null) {
                            userController.updateUser(User(
                                id: _formData['id'],
                                name: _formData['name'],
                                address: _formData['address'],
                                city: _formData['city'],
                                email: _formData['email']));
                          } else {
                            userController.createUser(User(
                              name: _formData['name'],
                              address: _formData['address'],
                              city: _formData['city'],
                              email: _formData['email'],
                            ));
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
