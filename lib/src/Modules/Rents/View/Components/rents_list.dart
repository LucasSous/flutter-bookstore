import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:intl/intl.dart';

class RentsList extends StatelessWidget {
  final Rent rent;
  const RentsList({super.key, required this.rent});

  formatDate(String date) {
    return DateFormat('dd/MM/yyy').format(DateTime.parse(date));
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    DateTime currentDate = DateTime.parse(formatted);
    DateTime forecastDate = DateTime.parse(rent.forecastDate);

    Color? color() {
      if (rent.returnDate != null && rent.returnDate != 'in progress') {
        DateTime returnDate = DateTime.parse(rent.returnDate);
        if (returnDate.compareTo(forecastDate) <= 0) {
          return const Color.fromARGB(177, 38, 214, 44);
        } else {
          return const Color.fromARGB(176, 255, 57, 57);
        }
      } else {
        if (forecastDate.compareTo(currentDate) < 0) {
          return const Color.fromARGB(255, 255, 126, 13);
        } else {
          return Theme.of(context).primaryColor;
        }
      }
    }

    tooltipMessage() {
      if (rent.returnDate != null && rent.returnDate != 'in progress') {
        DateTime returnDate = DateTime.parse(rent.returnDate);
        if (returnDate.compareTo(forecastDate) <= 0) {
          return 'No prazo';
        } else {
          return 'Em atraso';
        }
      } else {
        if (forecastDate.compareTo(currentDate) < 0) {
          return "Pendente";
        } else {
          return 'Em andamento';
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Tooltip(
            message: tooltipMessage(),
            child: Column(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: color()!,
                  size: 16,
                ),
                Text(
                  formatDate(rent.creationDate),
                  style: TextStyle(color: color()!, fontSize: 8),
                ),
                Text(
                  ' até ',
                  style: TextStyle(color: color()!, fontSize: 8),
                ),
                Text(
                  formatDate(rent.forecastDate),
                  style: TextStyle(color: color()!, fontSize: 8),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(bottom: 7),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    spreadRadius: 0.1,
                    blurRadius: 10,
                    color: Colors.black26,
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Cliente: ',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Text(
                                  rent.user!.name,
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Livro: ',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Text(rent.book!.name,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
