import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          return const Color(0xFF54D572);
        } else {
          return const Color(0xFFFF7E7E);
        }
      } else {
        if (forecastDate.compareTo(currentDate) < 0) {
          return const Color(0xFFFFE941);
        } else {
          return Theme.of(context).primaryColor;
        }
      }
    }

    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/rents/details', arguments: rent);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Theme.of(context).shadowColor,
                offset: const Offset(0, 0))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Theme.of(context).shadowColor,
                        offset: const Offset(0, 0))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: color()!,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Cliente: ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Expanded(
                                child: Text(
                                  rent.user!.name,
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Livro: ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Expanded(
                                child: Text(rent.book!.name,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${formatDate(rent.creationDate)} até ${formatDate(rent.forecastDate)}',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
