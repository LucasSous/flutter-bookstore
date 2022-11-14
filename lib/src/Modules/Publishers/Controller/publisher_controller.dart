// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Model/publisher_model.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Repository/publisher_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'publisher_controller.g.dart';

class PublisherController = _PublisherControllerBase with _$PublisherController;

abstract class _PublisherControllerBase with Store {
  final PublisherRepository publisherRepo;

  _PublisherControllerBase(this.publisherRepo) {
    getAllPublishers();
  }

  @observable
  List<Publisher> publishers = [];

  @observable
  List<Publisher> publishersFilter = [];

  @observable
  bool isEmptyInput = true;

  @observable
  bool loading = false;

  @action
  getAllPublishers() async {
    loading = true;
    try {
      final response = await publisherRepo.getAll();
      response.sort((a, b) => b.id.compareTo(a.id));
      publishers = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar editoras', 'error');
    } finally {
      loading = false;
    }
  }

  @action
  createPublisher(Publisher publisher) async {
    // ignore: unnecessary_null_comparison
    if (publisher != null) {
      loading = true;
      try {
        await publisherRepo.save(publisher);
        showSnackBar('Editora cadastrada com sucesso', 'success');
        await getAllPublishers();
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar cadastar editora', 'error');
      } finally {
        loading = false;
      }
    }
  }

  @action
  updatePublisher(Publisher publisher) async {
    // ignore: unnecessary_null_comparison
    if (publisher != null && publisher.id != null) {
      try {
        await publisherRepo.update(publisher);
        showSnackBar('Editora editada com sucesso', 'success');
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar editar editora', 'error');
      } finally {
        await getAllPublishers();
      }
    }
  }

  @action
  deletePublisher(Publisher publisher) async {
    // ignore: unnecessary_null_comparison
    if (publisher != null) {
      try {
        await publisherRepo.delete(publisher);
        showSnackBar('Editora deletada com sucesso', 'success');
        Modular.to.navigate('/publishers/');
      } catch (e) {
        showSnackBar('Erro: Não é posivel deletar esta editora', 'error');
      } finally {
        await getAllPublishers();
      }
    }
  }

  @action
  filter(String value) async {
    if (value.isEmpty) {
      publishersFilter = [];
      isEmptyInput = true;
      return;
    } else {
      isEmptyInput = false;
    }

    List<Publisher> list = publishers
        .where(
          (e) =>
              e.id.toString().toLowerCase().contains(
                    value.toString(),
                  ) ||
              e.name.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.city.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ),
        )
        .toList();

    publishersFilter = list;
  }

  @action
  resetFilter() {
    publishersFilter = [];
    isEmptyInput = true;
  }
}
