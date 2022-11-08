import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_button.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Components/outline_button.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:intl/intl.dart';

class RentsDetail extends StatelessWidget {
  final Rent rent;
  const RentsDetail({super.key, required this.rent});

  formatDate(String date) {
    return DateFormat('dd/MM/yyy').format(DateTime.parse(date));
  }

  returnDate() {
    if (rent.returnDate != null && rent.returnDate != 'in progress') {
      return Text(
        formatDate(rent.returnDate),
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

  actionButtons() {
    if (rent.returnDate == null || rent.returnDate == 'in progress') {
      return Column(
        children: [
          DefaultButton(text: 'Finalizar', isLoading: false, click: () {}),
          const SizedBox(height: 15),
          OutlineButton(text: 'Cancelar', isLoading: false, click: () {})
        ],
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    DateTime currentDate = DateTime.parse(formatted);
    DateTime forecastDate = DateTime.parse(rent.forecastDate);

    status() {
      if (rent.returnDate != null && rent.returnDate != 'in progress') {
        DateTime returnDate = DateTime.parse(rent.returnDate);
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
                      rent.id.toString(),
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
                      rent.user!.name,
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
                      rent.book!.name,
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
                      formatDate(rent.creationDate),
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
                      formatDate(rent.forecastDate),
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
