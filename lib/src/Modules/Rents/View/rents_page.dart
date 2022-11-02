import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/finished_rents.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rents_in%20_progress.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RentsPage extends StatefulWidget {
  const RentsPage({Key? key}) : super(key: key);

  @override
  State<RentsPage> createState() => _RentsPageState();
}

class _RentsPageState extends State<RentsPage> {
  @override
  Widget build(BuildContext context) {
    final rentController = Modular.get<RentController>();
    return Observer(
        name: 'observerRentPage',
        builder: (_) {
          if (rentController.loading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
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
                                Modular.to.pushNamed('/users_filter');
                              },
                              icon: const Icon(Icons.search),
                              color: Colors.black),
                          IconButton(
                              onPressed: () {
                                Modular.to.pushNamed('/user_form');
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
                                fontSize: 14, fontWeight: FontWeight.bold),
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
                                      height: 16,
                                      width: 16,
                                      padding: const EdgeInsets.all(1.0),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            rentController
                                                .rentsInProgress.length
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
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
