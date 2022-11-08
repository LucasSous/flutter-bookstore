import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/finished_rents.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rents_in_progress.dart';
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
  Widget build(BuildContext context) {
    return Observer(
        name: 'observerRentPage',
        builder: (_) {
          if (rentController.loading == true) {
            return const LoadingPage();
          } else {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                  backgroundColor: Theme.of(context).backgroundColor,
                  appBar: AppBar(
                    title: const DefaultTitle(text: 'Aluguéis'),
                    elevation: 0,
                    backgroundColor: Colors.white,
                    actions: <Widget>[
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Modular.to.pushNamed('/rents/filter');
                              },
                              icon: const Icon(Icons.search),
                              color: Colors.black),
                          IconButton(
                              onPressed: () {
                                Modular.to.pushNamed('/rents/form');
                              },
                              icon: const Icon(Icons.add),
                              color: Colors.black)
                        ],
                      )
                    ],
                  ),
                  body: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: TabBar(
                            indicatorWeight: 3.0,
                            indicatorColor: Theme.of(context).primaryColor,
                            labelColor: Theme.of(context).primaryColor,
                            labelStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            rentController
                                                .rentsInProgress.length
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
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
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [RentsInProgress(), FinishedRents()],
                        ),
                      )
                    ],
                  )),
            );
          }
        });
  }
}
