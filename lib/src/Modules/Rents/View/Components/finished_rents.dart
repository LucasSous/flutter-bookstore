// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rents_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinishedRents extends StatefulWidget {
  const FinishedRents({Key? key}) : super(key: key);

  @override
  State<FinishedRents> createState() => _FinishedRentsState();
}

class _FinishedRentsState extends State<FinishedRents> {
  final filterRents = ['Todos', 'Em atraso', 'No prazo'];
  late String _filterValue = 'Todos';

  final ScrollController _scrollController = ScrollController();

  updateFilterValue(value) {
    setState(() {
      _filterValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(findAll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  findAll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _filterValue == 'Todos') {
      rentController.getFinishedRents(false);
    }
  }

  final rentController = Modular.get<RentController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 80, left: 12, right: 12),
          child: Observer(
              name: 'observerFinishedRents',
              builder: (_) {
                if (rentController.loading == true) {
                  return const LoadingPage();
                } else if (rentController.finishedRents.isEmpty) {
                  return const Text('Nenhum aluguél finalizado no momento');
                } else {
                  return Column(
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
                                value: _filterValue,
                                style: Theme.of(context).textTheme.bodyText2,
                                dropdownColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                items: filterRents.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                onChanged: (value) {
                                  updateFilterValue(value);
                                  rentController.filterFinishedRents(value);
                                }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: rentController.finishedRents.length,
                          itemBuilder: (ctx, i) =>
                              RentsList(rent: rentController.finishedRents[i])),
                    ],
                  );
                }
              })),
    );
  }
}
