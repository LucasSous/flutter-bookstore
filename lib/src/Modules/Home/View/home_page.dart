import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/modules/home/controller/home_controller.dart';
import 'package:flutter_bookstore2/src/modules/home/view/components/chart.dart';
import 'package:flutter_bookstore2/src/modules/home/view/components/item_card.dart';
import 'package:flutter_bookstore2/src/modules/home/view/components/loading_page.dart';
import 'package:flutter_bookstore2/src/modules/home/view/components/most_rented.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = Modular.get<HomeController>();

  @override
  void initState() {
    _homeController.getUsersQuantity();
    _homeController.getBooksQuantity();
    _homeController.getBooksMostRented();
    _homeController.getPublishersQuantity();
    _homeController.getRentsQuantity();
    _homeController.setValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Modular.to.pushNamed('/menu');
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Observer(builder: (_) {
        if (_homeController.loading) {
          return const LoadingPage();
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informações Gerais',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ItemCard(
                          name: 'Usuários',
                          icon: Icons.person_outline,
                          quantity: _homeController.usersQuantity,
                          cardColor: Theme.of(context).primaryColor,
                          route: '/users/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          name: 'Editoras',
                          icon: Icons.align_vertical_bottom_sharp,
                          quantity: _homeController.publishersQuantity,
                          route: '/publishers/',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ItemCard(
                          name: 'Livros',
                          icon: Icons.book_outlined,
                          quantity: _homeController.booksQuantity,
                          route: '/books/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          name: 'Aluguéis',
                          icon: Icons.calendar_today_outlined,
                          quantity: _homeController.rentsQuantity,
                          route: '/rents/',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _homeController.booksMostRented.isNotEmpty &&
                            _homeController.booksMostRented[0].totalRented! < 1
                        ? const SizedBox()
                        : Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).shadowColor,
                                  blurRadius: 20,
                                  offset: const Offset(0, 0), // Shadow position
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Status dos Aluguéis',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Chart(
                                    inProgress: _homeController.inProgress,
                                    onTime: _homeController.onTime,
                                    late: _homeController.late,
                                    pending: _homeController.pending,
                                  )
                                ],
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    _homeController.booksMostRented.isNotEmpty
                        ? MostRentedCard(
                            name: _homeController.booksMostRented[0].name,
                            quantity: _homeController
                                .booksMostRented[0].totalRented
                                .toString(),
                          )
                        : const SizedBox()
                  ]),
            ),
          );
        }
      }),
    );
  }
}
