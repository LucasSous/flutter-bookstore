import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Modules/Home/Controller/home_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/Components/chart.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/Components/item_card.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/Components/most_rented.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Modular.get<HomeController>();
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
        if (homeController.loadingRents ||
            homeController.loadingBooks ||
            homeController.loadingMostRenteds ||
            homeController.loadingPublishers ||
            homeController.loadingUsers) {
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
                          quantity: homeController.users.length.toString(),
                          cardColor: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          name: 'Editoras',
                          icon: Icons.person_outline,
                          quantity: homeController.publishers.length.toString(),
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
                          quantity: homeController.books.length.toString(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          name: 'Aluguéis',
                          icon: Icons.calendar_today_outlined,
                          quantity: homeController.rents.length.toString(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 0), // Shadow position
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
                    MostRentedCard(
                      name: homeController.mostRented[0].name,
                      quantity:
                          homeController.mostRented[0].totalRented.toString(),
                    )
                  ]),
            ),
          );
        }
      }),
    );
  }
}
