import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/add_button.dart';
import 'package:flutter_bookstore2/src/Components/default_app_bar.dart';
import 'package:flutter_bookstore2/src/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/View/Components/publishers_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PublishersPage extends StatefulWidget {
  const PublishersPage({Key? key}) : super(key: key);

  @override
  State<PublishersPage> createState() => _PublishersPageState();
}

class _PublishersPageState extends State<PublishersPage> {
  final publisher = Modular.get<PublisherController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
        name: 'observerPublisherPage',
        builder: (_) {
          if (publisher.loading == true) {
            return const LoadingPage();
          } else {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: DefaultAppBar(
                title: 'Editoras',
                search: () {
                  publisher.resetFilter();
                  Modular.to.pushNamed('/publishers/filter');
                },
                border: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 80, left: 8, right: 8),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: publisher.publishers.length,
                      itemBuilder: (ctx, i) =>
                          PublishersList(publisher: publisher.publishers[i])),
                ),
              ),
              floatingActionButton: const AddButton(route: '/publishers/form'),
            );
          }
        });
  }
}
