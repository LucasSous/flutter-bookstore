import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/add_button.dart';
import 'package:flutter_bookstore2/src/components/default_app_bar.dart';
import 'package:flutter_bookstore2/src/components/loading_page.dart';
import 'package:flutter_bookstore2/src/modules/rents/controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/modules/rents/view/components/finished_rents.dart';
import 'package:flutter_bookstore2/src/modules/rents/view/components/rents_in_progress.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RentsPage extends StatefulWidget {
  const RentsPage({Key? key}) : super(key: key);

  @override
  State<RentsPage> createState() => _RentsPageState();
}

class _RentsPageState extends State<RentsPage> {
  final rentController = Modular.get<RentController>();

  @override
  void dispose() {
    super.dispose();
    Modular.dispose<RentController>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        name: 'observerRentPage',
        builder: (_) {
          if (rentController.loading) {
            return const LoadingPage();
          } else {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: DefaultAppBar(
                  title: 'Aluguéis',
                  search: () {
                    Modular.to.pushNamed('/rents/filter');
                    rentController.filterRents('');
                  },
                  elevation: 0,
                ),
                body: Column(
                  children: [
                    TabBar(
                        indicatorWeight: 3.0,
                        physics: const NeverScrollableScrollPhysics(),
                        indicatorColor: Theme.of(context).primaryColor,
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        onTap: (value) => {
                              Timer(const Duration(seconds: 1),
                                  () => rentController.updateLists())
                            },
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                    child: Text(
                                  'Em Andamento',
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  textAlign: TextAlign.center,
                                )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 18,
                                  width: 18,
                                  padding: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        rentController
                                            .defaultValueRentsInProgress.length
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Tab(
                            text: 'Finalizados',
                          )
                        ]),
                    const Expanded(
                      child: TabBarView(
                        children: [RentsInProgress(), FinishedRents()],
                      ),
                    )
                  ],
                ),
                floatingActionButton: const AddButton(route: '/rents/form'),
              ),
            );
          }
        });
  }
}
