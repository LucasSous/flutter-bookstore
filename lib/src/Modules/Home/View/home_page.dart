import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Home/Controller/home_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/Components/chart.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/Components/item_card.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/Components/most_rented.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();
  final userController = Modular.get<UserController>();
  final publisherController = Modular.get<PublisherController>();
  final bookController = Modular.get<BookController>();
  final rentController = Modular.get<RentController>();

  @override
  void initState() {
    homeController.setValues();
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
        if (rentController.loading ||
            bookController.loading ||
            bookController.loadingMostRenteds ||
            publisherController.loading ||
            userController.loading) {
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
                          quantity: userController.users.length.toString(),
                          cardColor: Theme.of(context).primaryColor,
                          route: '/users/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          name: 'Editoras',
                          icon: Icons.align_vertical_bottom_sharp,
                          quantity:
                              publisherController.publishers.length.toString(),
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
                          quantity: bookController.books.length.toString(),
                          route: '/books/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          name: 'Aluguéis',
                          icon: Icons.calendar_today_outlined,
                          quantity: rentController.rents.length.toString(),
                          route: '/rents/',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    bookController.mostRented[0].totalRented < 1
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
                                    inProgress: homeController.inProgress,
                                    onTime: homeController.onTime,
                                    late: homeController.late,
                                    pending: homeController.pending,
                                  )
                                ],
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    bookController.mostRented.isNotEmpty
                        ? MostRentedCard(
                            name: bookController.mostRented[0].name,
                            quantity: bookController.mostRented[0].totalRented
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
