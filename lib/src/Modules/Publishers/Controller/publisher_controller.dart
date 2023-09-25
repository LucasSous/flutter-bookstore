import 'package:flutter_bookstore2/src/components/snack_bar.dart';
import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/delete_publisher_usercase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/get_all_publishers_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/save_publisher_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/update_publisher_usecase.dart';
import 'package:flutter_bookstore2/src/core/extensions/compare_int_extension.dart';
import 'package:flutter_bookstore2/src/core/extensions/compare_string_extension.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'publisher_controller.g.dart';

class PublisherController = PublisherControllerBase with _$PublisherController;

abstract class PublisherControllerBase with Store {
  final GetAllPublishersUseCase _getAllPublishersUseCase;
  final SavePublisherUseCase _savePublisherUseCase;
  final UpdatePublisherUseCase _updatePublisherUseCase;
  final DeletePublisherUseCase _deletePublisherUseCase;

  PublisherControllerBase(
    this._getAllPublishersUseCase,
    this._savePublisherUseCase,
    this._updatePublisherUseCase,
    this._deletePublisherUseCase,
  ) {
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
      final response = await _getAllPublishersUseCase();
      publishers = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar editoras', Status.error);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> createPublisher(PublisherModel publisher) async {
    loading = true;
    try {
      await _savePublisherUseCase(publisher);
      showSnackBar('Editora cadastrada com sucesso', Status.success);
      await getAllPublishers();
      Modular.to.pop();
    } catch (e) {
      showSnackBar('Erro ao tentar cadastrar editora', Status.error);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> updatePublisher(PublisherModel publisher) async {
    if (publisher.id != null) {
      try {
        await _updatePublisherUseCase(publisher);
        showSnackBar('Editora editada com sucesso', Status.success);
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar editar editora', Status.error);
      } finally {
        await getAllPublishers();
      }
    }
  }

  @action
  Future<void> deletePublisher(PublisherModel publisher) async {
    try {
      await _deletePublisherUseCase(publisher);
      showSnackBar('Editora deletada com sucesso', Status.success);
      Modular.to.navigate('/publishers/');
    } catch (e) {
      showSnackBar('Erro: Não é posivel deletar esta editora', Status.error);
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
        .where((e) =>
            e.id!.compareIntValue(value) ||
            e.name.compareStringValue(value) ||
            e.city.compareStringValue(value))
        .toList();

    publishersFilter = list;
  }

  @action
  void resetFilter() {
    publishersFilter = [];
    isEmptyInput = true;
  }
}
