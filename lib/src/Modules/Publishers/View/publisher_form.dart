import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/default_button.dart';
import 'package:flutter_bookstore2/src/components/default_text_field.dart';
import 'package:flutter_bookstore2/src/components/default_title.dart';
import 'package:flutter_bookstore2/src/modules/publishers/controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PublisherForm extends StatefulWidget {
  final PublisherModel? publisher;
  const PublisherForm({Key? key, required this.publisher}) : super(key: key);

  @override
  State<PublisherForm> createState() => _PublisherFormState();
}

class _PublisherFormState extends State<PublisherForm> {
  final _publisherController = Modular.get<PublisherController>();
  final formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  late final String? Function(String? text)? validator;
  late final void Function(String? text)? onSaved;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      if (widget.publisher != null) {
        final publisher = widget.publisher;
        _formData['id'] = publisher!.id.toString();
        _formData['name'] = publisher.name;
        _formData['city'] = publisher.city;
      }
    }
  }

  String titulo() {
    if (_formData['id'] != null) {
      return 'Editar Editora';
    } else {
      return 'Nova Editora';
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
                        hintText: 'Digite o nome da editora',
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
                        labelText: 'Cidade',
                        hintText: 'Digite a cidade da editora',
                        initialValue: _formData['city'],
                        icon: Icons.location_city,
                        validation: (text) {
                          final validation = RegExp('[^A-Za-zÀ-ú ]');
                          if (text == null || text.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (text.length < 3) {
                            return 'O mínimo de caracteres é 3';
                          }
                          if (text.length > 20) {
                            return 'O máximo de caracteres é 20';
                          }
                          if (validation.hasMatch(text)) {
                            return 'Cidade inválida';
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
                        isLoading: _publisherController.loading,
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
        _publisherController.updatePublisher(
          PublisherModel(
            id: int.parse(_formData['id']!),
            name: _formData['name']!,
            city: _formData['city']!,
          ),
        );
      } else {
        _publisherController.createPublisher(
          PublisherModel(
            name: _formData['name']!,
            city: _formData['city']!,
          ),
        );
      }
    }
  }
}
