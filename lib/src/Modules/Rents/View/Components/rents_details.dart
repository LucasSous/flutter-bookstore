import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_button.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Components/dialog.dart';
import 'package:flutter_bookstore2/src/Components/outline_button.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Model/book_model.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Model/user_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class RentsDetail extends StatefulWidget {
  final Rent rent;
  const RentsDetail({super.key, required this.rent});

  @override
  State<RentsDetail> createState() => _RentsDetailState();
}

class _RentsDetailState extends State<RentsDetail> {
  final rentController = Modular.get<RentController>();

  formatDate(String date) {
    return DateFormat('dd/MM/yyy').format(DateTime.parse(date));
  }

  returnDate() {
    if (widget.rent.returnDate != null &&
        widget.rent.returnDate != 'in progress') {
      return Text(
        formatDate(widget.rent.returnDate),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      );
    } else {
      return const Text(
        'Não devolvido',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      );
    }
  }

  finalizeRent() {
    rentController.updateRent(Rent(
        id: widget.rent.id,
        creationDate: widget.rent.creationDate,
        returnDate: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
        forecastDate: widget.rent.forecastDate,
        book: Book(
            id: widget.rent.book!.id,
            name: '',
            publisher: null,
            author: '',
            launch: '',
            quantity: ''),
        user: User(
            id: widget.rent.user!.id,
            name: '',
            address: '',
            city: '',
            email: '')));
  }

  deleteRent() {
    rentController.deleteRent(Rent(
        id: widget.rent.id,
        creationDate: widget.rent.creationDate,
        returnDate: null,
        forecastDate: widget.rent.forecastDate,
        book: Book(
            id: widget.rent.book!.id,
            name: widget.rent.book!.name,
            publisher: null,
            author: '',
            launch: '',
            quantity: ''),
        user: User(
            id: widget.rent.user!.id,
            name: '',
            address: '',
            city: '',
            email: '')));
  }

  actionButtons() {
    if (widget.rent.returnDate == null ||
        widget.rent.returnDate == 'in progress') {
      return Observer(builder: (_) {
        return Column(
          children: [
            DefaultButton(
                text: 'Finalizar',
                isLoading: rentController.loadingFinished,
                click: () {
                  openDialog(
                      context: context,
                      title: 'Finalizar Aluguél',
                      message: 'Este aluguél será finalizado!',
                      confirm: () {
                        finalizeRent();
                        Modular.to.pop();
                      });
                }),
            const SizedBox(height: 15),
            OutlineButton(
                text: 'Cancelar',
                isLoading: rentController.loadingDelete,
                click: () {
                  openDialog(
                      context: context,
                      title: 'Cancelar Aluguél',
                      message:
                          'Este aluguél será cancelado e deletado da base de dados!',
                      confirm: () {
                        deleteRent();
                        Modular.to.pop();
                      });
                })
          ],
        );
      });
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    DateTime currentDate = DateTime.parse(formatted);
    DateTime forecastDate = DateTime.parse(widget.rent.forecastDate);

    status() {
      if (widget.rent.returnDate != null &&
          widget.rent.returnDate != 'in progress') {
        DateTime returnDate = DateTime.parse(widget.rent.returnDate);
        if (returnDate.compareTo(forecastDate) <= 0) {
          return const Text('Entregue no Prazo',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color.fromARGB(177, 38, 214, 44)));
        } else {
          return const Text('Entregue com Atraso',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color.fromARGB(176, 255, 57, 57)));
        }
      } else {
        if (forecastDate.compareTo(currentDate) < 0) {
          return const Text('Entrega Pendente',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 126, 13)));
        } else {
          return Text('Em Andamento',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor));
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DefaultTitle(text: "Detalhes do Aluguél"),
                    const SizedBox(height: 20),
                    const Text(
                      'Status',
                      style: TextStyle(fontSize: 16),
                    ),
                    status(),
                    const SizedBox(height: 15),
                    const Text(
                      'Id',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      widget.rent.id.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Cliente',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      widget.rent.user!.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Livro',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      widget.rent.book!.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Data Início',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      formatDate(widget.rent.creationDate),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Data Previsão de Entrega',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      formatDate(widget.rent.forecastDate),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Data Devulução',
                      style: TextStyle(fontSize: 16),
                    ),
                    returnDate(),
                  ],
                ),
                actionButtons()
              ]),
        );
      }),
    );
  }
}
