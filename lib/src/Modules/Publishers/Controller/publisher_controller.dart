import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_bookstore2/src/core/domain/useCases/publishers_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'publisher_controller.g.dart';

class PublisherController = PublisherControllerBase with _$PublisherController;

abstract class PublisherControllerBase with Store {
  final PublishersUseCase _publishersUseCase;

  PublisherControllerBase(this._publishersUseCase) {
    getAllPublishers();
  }

  @observable
  List<PublisherModel> publishers = [];

  @observable
  List<PublisherModel> publishersFilter = [];

  @observable
  bool isEmptyInput = true;

  @observable
  bool loading = false;

  @action
  Future<void> getAllPublishers() async {
    loading = true;
    try {
      final response = await _publishersUseCase.getAll();
      publishers = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar editoras', 'error');
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> createPublisher(PublisherModel publisher) async {
    loading = true;
    try {
      await _publishersUseCase.save(publisher);
      showSnackBar('Editora cadastrada com sucesso', 'success');
      await getAllPublishers();
      Modular.to.pop();
    } catch (e) {
      showSnackBar('Erro ao tentar cadastrar editora', 'error');
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> updatePublisher(PublisherModel publisher) async {
    if (publisher.id != null) {
      try {
        await _publishersUseCase.update(publisher);
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
  Future<void> deletePublisher(PublisherModel publisher) async {
    try {
      await _publishersUseCase.delete(publisher);
      showSnackBar('Editora deletada com sucesso', 'success');
      Modular.to.navigate('/publishers/');
    } catch (e) {
      showSnackBar('Erro: Não é posivel deletar esta editora', 'error');
    } finally {
      await getAllPublishers();
    }
  }

  @action
  void filter(String value) {
    if (value.isEmpty) {
      publishersFilter = [];
      isEmptyInput = true;
      return;
    } else {
      isEmptyInput = false;
    }

    List<PublisherModel> list = publishers
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
  void resetFilter() {
    publishersFilter = [];
    isEmptyInput = true;
  }
}
