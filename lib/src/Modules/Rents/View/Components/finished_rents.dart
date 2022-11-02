// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rents_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinishedRents extends StatefulWidget {
  const FinishedRents({Key? key}) : super(key: key);

  @override
  State<FinishedRents> createState() => _FinishedRentsState();
}

class _FinishedRentsState extends State<FinishedRents> {
  final valueFilter = '';
  final filterRents = ['Todos', 'Em atraso', 'No prazo'];

  @override
  Widget build(BuildContext context) {
    final rentController = Modular.get<RentController>();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
            name: 'observerFinishedRents',
            builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.filter_alt_rounded,
                            size: 16, color: Colors.grey.shade600),
                        Text(
                          'Filtrar por',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 40,
                          child: DropdownButton<String>(
                              value: 'Todos',
                              items: const [
                                DropdownMenuItem(
                                  value: 'Todos',
                                  child: Text('Todos'),
                                ),
                                DropdownMenuItem(
                                  value: 'Em atraso',
                                  child: Text('Em atraso'),
                                ),
                                DropdownMenuItem(
                                  value: 'No prazo',
                                  child: Text('No prazo'),
                                ),
                              ],
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onChanged: (value) {
                                setState(() {});
                              }),
                        )
                      ],
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: rentController.finishedRents.length,
                        itemBuilder: (ctx, i) =>
                            RentsList(rent: rentController.finishedRents[i])),
                  ],
                ),
              );
            }));
  }
}
