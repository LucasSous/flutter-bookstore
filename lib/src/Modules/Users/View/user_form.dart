import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/default_button.dart';
import 'package:flutter_bookstore2/src/components/default_text_field.dart';
import 'package:flutter_bookstore2/src/components/default_title.dart';
import 'package:flutter_bookstore2/src/modules/users/controller/user_controller.dart';
import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserForm extends StatefulWidget {
  final UserModel? user;
  const UserForm({Key? key, required this.user}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _userController = Modular.get<UserController>();
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

  String titulo() {
    if (_formData['id'] != null) {
      return 'Editar Usuário';
    } else {
      return 'Novo Usuário';
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
                        hintText: 'Digite o nome do usuário',
                        initialValue: _formData['name'],
                        icon: Icons.person_outline,
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
                        labelText: 'E-mail',
                        hintText: 'Digite o e-mail do usuário',
                        initialValue: _formData['email'],
                        icon: Icons.email_outlined,
                        validation: (text) {
                          final validation =
                              RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                          if (text == null || text.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (!validation.hasMatch(text)) {
                            return 'E-mail inválido!';
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
                        isLoading: _userController.loading,
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
        _userController.updateUser(
          UserModel(
            id: int.parse(_formData['id']!),
            name: _formData['name']!,
            address: _formData['address']!,
            city: _formData['city']!,
            email: _formData['email']!,
          ),
        );
      } else {
        _userController.createUser(
          UserModel(
            name:
                _formData['name'].toString().replaceAll(RegExp('/( )+/g'), " "),
            address: _formData['address']!,
            city: _formData['city']!,
            email: _formData['email']!,
          ),
        );
      }
    }
  }
}
