// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rents_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RentsInProgress extends StatefulWidget {
  const RentsInProgress({Key? key}) : super(key: key);

  @override
  State<RentsInProgress> createState() => _RentsInProgressState();
}

class _RentsInProgressState extends State<RentsInProgress> {
  final filterRents = ['Todos', 'Pendentes', 'Em andamento'];
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
      rentController.getRentsInProgress(false);
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
              name: 'observerRentsInProgress',
              builder: (_) {
                if (rentController.loading == true) {
                  return const LoadingPage();
                } else if (rentController.rentsInProgress.isEmpty) {
                  return const Text('Nenhum aluguél em andamento');
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
                                  rentController.filterRentsInProgress(value);
                                }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: rentController.rentsInProgress.length,
                          itemBuilder: (ctx, i) => RentsList(
                              rent: rentController.rentsInProgress[i])),
                    ],
                  );
                }
              })),
    );
  }
}
